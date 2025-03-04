import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/dictionary_app_bar.dart';
import 'widgets/dictionary_listview.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            dictionaryAppBar(),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: dictionaryListView(),
            )),
          ],
        ),
      ),
    );
  }
}
