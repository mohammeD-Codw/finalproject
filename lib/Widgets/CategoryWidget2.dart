import 'package:final_project/Data/data.dart';
import 'package:final_project/Models/CategoryModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget2 extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryWidget2(this.categoryModel);

  @override
  Widget build(BuildContext context) => Consumer<MainProvider>(
        builder: (context, provider, x) {
          return InkWell(
            onTap: (){provider.onIndexCourseChanged(categoryModel.catName);},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(),
                width: 75,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: categoryModel.catName ==
                       provider.selectedNameCourse
                        ? Colors.blue
                        : Colors.white),
                child: Text(categoryModel.catName,
                  style: TextStyle(color: categoryModel.catName ==
                      provider.selectedNameCourse
                      ? Colors.white
                      : Colors.grey),),
              ),
            ),
          );
        }
    );
}
