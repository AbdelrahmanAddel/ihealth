import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/home/data/home_data.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = HomeData.homeData[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blue, // لون الـ AppBar
        elevation: 0, // إزالة الظل
        centerTitle: true, // توسيط العنوان
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: AppTextStyle.poppins60030.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              item.description,
              style: AppTextStyle.poppins40014.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}