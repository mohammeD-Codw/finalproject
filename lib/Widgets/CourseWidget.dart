import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/CourseInfoScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CourseWidget extends StatelessWidget {
  CourseModel courseModel;
  CourseWidget(this.courseModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context,provider,x) {
        return InkWell(
          onTap: ()
          {
             provider.getAllSections(courseModel);
            RouterClass.routerClass.pushToScreen(CourseInfoScreen(courseModel));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              width: 340.w,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: courseModel.imageUrl != null
                          ? Image.network(
                              courseModel.imageUrl,
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(courseModel.nameCou),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              courseModel.trainerCou,
                              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                            )
                          ],
                        )),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${courseModel.price}',
                                style:
                                    TextStyle(fontSize: 16.sp, color: Colors.blue),
                              ),
                              SizedBox(width: 15),
                              Text(
                                '${courseModel.noOfHours} hours',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    backgroundColor:
                                        Color.fromRGBO(255, 235, 240, 1),
                                    color: Colors.orange.shade700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
