import 'package:final_project/Models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
CategoryModel categoryModel;
SearchWidget(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),        color: Colors.grey.shade300,
          ),
          child:Text(categoryModel.catName,style: TextStyle(fontSize: 12.sp,color: Colors.grey.shade700),) ,
        ),
      ),
    );
  }
}
