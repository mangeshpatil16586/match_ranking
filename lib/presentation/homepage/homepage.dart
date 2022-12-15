import 'package:flutter/material.dart';

import '../odi/odi.dart';
import '../t20/t20.dart';
import '../test/test.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('RANKING'),
            bottom: const TabBar(
                tabs: [
                  Tab(text: 'ODI',),
                  Tab(text: 'TEST',),
                  Tab(text:'T20')
                ])
        ),
        body:  TabBarView(
            children: [
              Odi(),
              Test(),
              T20()
        ]),
      ),
    );
  }
}
