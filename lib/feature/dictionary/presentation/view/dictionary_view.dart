import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 30,
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: dictionaryListView(),
            )),
          ],
        ),
      ),
    );
  }
}
