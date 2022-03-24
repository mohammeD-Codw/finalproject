import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Data/data.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Providers/auth_helper.dart';
import 'package:final_project/Widgets/CategoryWidget.dart';
import 'package:final_project/Widgets/CategoryWidget2.dart';
import 'package:final_project/Widgets/CourseWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider0, x) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Course'.tr(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<MainProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(

                    controller: provider.searchController,
                    decoration: InputDecoration(
                        fillColor: Color.fromRGBO(224, 243, 253, 0.4),
                        filled: true,
                        hintText: 'Find  Course',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                            onPressed: () {
                            }, icon: Icon(Icons.filter_list))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: listCat
                                .map((e) => CategoryWidget(e))
                                .toList())),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Choice your course',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    children: provider.listCourseIndex
                        .map((e) => CategoryWidget2(e))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: provider0.allCourses.map((e) {
                        return CourseWidget(e);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
