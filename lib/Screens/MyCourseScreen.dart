import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Widgets/MyCourseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'My Courses ${provider.favouriteList.length} ${provider.myCourseList.length}',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: GridView.count(
              crossAxisCount: 2,
              children:

              provider.favouriteList.map((e) => MyCourseWidget(e)).toList(),
            ),
          ),
        ),
      );
    });
  }
}
