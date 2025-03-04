import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/dictionary/data/disease_info.dart';
import 'package:i_health/feature/dictionary/presentation/view/dictionary_content.dart';

import 'dictionary_list_content.dart';

Widget dictionaryListView() {
  return ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemCount: diseaseInfo.length,
    itemBuilder: (context, index) {
      return SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigation.push(
                context: context,
                pushScreen: DictionaryContent(
                  index: index,
                ));
          },
          child: dictionaryListContent(
            index: index,
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return  SizedBox(
        height: 20.h,
      );
    },
  );
}
