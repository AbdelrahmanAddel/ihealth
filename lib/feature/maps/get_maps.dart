import 'dart:async'; // أضف هذه الاستيراد لاستخدام StreamSubscription
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/assets.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<Marker> markers = [];
  List<LatLng> pharmacyRoutePoints = [];
  List<LatLng> hospitalRoutePoints = [];
  final Distance distance = const Distance();
  StreamSubscription<LocationData>? _locationSubscription; // جعله nullable
  bool _isDisposed = false; // متغير لتتبع حالة الـ Widget

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _isDisposed = true; // تحديث حالة الـ Widget إلى "تم التخلص منه"
    _locationSubscription?.cancel(); // إلغاء الاشتراك إذا كان موجودًا
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();
    try {
      var userLocation = await location.getLocation();
      if (!_isDisposed && mounted) {
        setState(() {
          currentLocation = userLocation;
          markers.add(
            Marker(
              width: 50.0.w,
              height: 50.0.h,
              point: LatLng(userLocation.latitude!, userLocation.longitude!),
              child: SvgPicture.asset(Assets.assetsImagesMarker),
            ),
          );
        });
      }

      fetchNearbyPlaces("pharmacy");
      fetchNearbyPlaces("hospital");
    } on Exception {
      if (!_isDisposed && mounted) {
        setState(() {
          currentLocation = null;
        });
      }
    }

    // الاستماع لتغيرات الموقع
    _locationSubscription =
        location.onLocationChanged.listen((LocationData newLocation) {
      if (!_isDisposed && mounted) {
        // التحقق من أن الـ Widget ما زال موجودًا
        setState(() {
          currentLocation = newLocation;
        });
      }
    });
  }

  Future<void> fetchNearbyPlaces(String placeType) async {
    if (currentLocation == null || _isDisposed)
      return; // التحقق من حالة الـ Widget

    final double lat = currentLocation!.latitude!;
    final double lon = currentLocation!.longitude!;
    final String overpassQuery = """
      [out:json];
      node[amenity=$placeType](around:50000, $lat, $lon);
      out;
    """;

    final response = await http.get(
      Uri.parse(
          'https://overpass-api.de/api/interpreter?data=${Uri.encodeComponent(overpassQuery)}'),
    );

    if (response.statusCode == 200 && !_isDisposed && mounted) {
      // التحقق من حالة الـ Widget
      final data = json.decode(response.body);
      final List<dynamic> elements = data['elements'];

      setState(() {
        double minDistance = double.infinity;
        LatLng? nearestPlace;

        for (var element in elements) {
          final double placeLat = element['lat'];
          final double placeLon = element['lon'];
          final String name = element['tags']['name'] ?? 'مكان مجهول';
          LatLng placeLocation = LatLng(placeLat, placeLon);

          double calculatedDistance = distance.as(
            LengthUnit.Kilometer,
            LatLng(lat, lon),
            placeLocation,
          );

          if (calculatedDistance < minDistance) {
            minDistance = calculatedDistance;
            nearestPlace = placeLocation;
          }

          markers.add(
            Marker(
              width: 50.0.w,
              height: 50.0.h,
              point: placeLocation,
              child: Tooltip(
                message: name,
                child: SvgPicture.asset(
                  placeType == "pharmacy"
                      ? Assets.assetsImagesFirstHu
                      : Assets.assetsImagesHospital,
                ),
              ),
            ),
          );
        }

        if (nearestPlace != null) {
          fetchRoute(LatLng(lat, lon), nearestPlace, placeType);
        }

        if (markers.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!_isDisposed && mounted) {
              try {
                mapController.move(
                  markers.first.point,
                  14.0,
                );
              } catch (e) {
                print('❌ خطأ أثناء تحريك الخريطة: $e');
              }
            }
          });
        }
      });
    } else {
      print('❌ فشل في جلب بيانات $placeType');
    }
  }

  Future<void> fetchRoute(LatLng start, LatLng end, String placeType) async {
    if (_isDisposed) return;

    final String url =
        "https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 && !_isDisposed && mounted) {
        final data = json.decode(response.body);
        final List<dynamic> coordinates =
            data['routes'][0]['geometry']['coordinates'];

        setState(() {
          if (placeType == "pharmacy") {
            pharmacyRoutePoints =
                coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
          } else {
            hospitalRoutePoints =
                coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
          }
        });
      } else {
        print('❌ فشل في جلب المسار لـ $placeType');
      }
    } catch (e) {
      print('❌ خطأ أثناء جلب المسار: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'IHealth Map',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                initialZoom: 12.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                MarkerLayer(
                  markers: markers,
                ),
                PolylineLayer(
                  polylines: [
                    if (pharmacyRoutePoints.isNotEmpty)
                      Polyline(
                        points: pharmacyRoutePoints,
                        color: AppColors.greenButton,
                        strokeWidth: 5.0,
                      ),
                    if (hospitalRoutePoints.isNotEmpty)
                      Polyline(
                        points: hospitalRoutePoints,
                        color: Colors.red,
                        strokeWidth: 4.0,
                      ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: () {
          fetchNearbyPlaces("pharmacy");
          fetchNearbyPlaces("hospital");
        },
        child: const Icon(
          Icons.location_searching_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
