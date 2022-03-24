import 'package:final_project/Models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryWidget(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 160.w,
          height: 90.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),      color: categoryModel.color,
          ),
          child: Stack(
            children: [
              Positioned(
                  bottom: 15,
                  right: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                    width: 80.w,
                    height: 25.h,
                    child: Text(categoryModel.catName,style: TextStyle(color: Colors.grey.shade500),),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
