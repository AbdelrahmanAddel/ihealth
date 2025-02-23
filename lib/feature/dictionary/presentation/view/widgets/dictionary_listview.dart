import 'package:flutter/material.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/dictionary/data/disease_info.dart';
import 'package:i_health/feature/dictionary/presentation/view/dictionary_content.dart';

import 'dictionary_list_content.dart';

Widget dictionaryListView() {
  return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: diseaseInfo.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 60,
          height: 60,
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
      });
}
