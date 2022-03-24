import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/CourseInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../router.dart';

class MyCourseWidget extends StatelessWidget {
  CourseModel courseModel;
  MyCourseWidget(this.courseModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context,provider,x) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: (){
              provider.getAllSections(courseModel);
              RouterClass.routerClass.pushToScreen(CourseInfoScreen(courseModel));

            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),        color: Colors.redAccent,
              ),
              width: 160.w,
              height: 182.7.h,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(courseModel.nameCou,style:TextStyle(fontSize: 16.sp),softWrap: true ,)
              ,Text('Completed '),
                Row(children: [
                  Text('15/20'),
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_filled))
                ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
              ],
              ),
            ),
          ),
        );
      }
    );
  }
}
