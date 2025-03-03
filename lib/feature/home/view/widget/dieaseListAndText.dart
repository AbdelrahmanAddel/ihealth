import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/home/data/home_data.dart';
import 'package:i_health/feature/home/view/widget/diease_list_and_text.dart';

class DieaseListsAndText extends StatelessWidget {
  const DieaseListsAndText({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 300,
                    width: 380,
                    HomeData.homeData[index].imageUrl,
                    fit: BoxFit.fill,
                  )),
              onTap: () {
                Navigation.push(
                    context: context, pushScreen: DetailScreen(index: index));
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(HomeData.homeData[index].title,
              style: AppTextStyle.poppins60030.copyWith(fontSize: 20),
              textAlign: TextAlign.start),
          const SizedBox(
            height: 20,
          ),
          Text(HomeData.homeData[index].description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.poppins40014.copyWith(fontSize: 15),
              textAlign: TextAlign.start),
        ],
      ),
    );
  }
}
