import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)) ),
        enableDrag: false,
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 500.h,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Provider.of<MainProvider>(context,listen: false).onChangeBoSheetValue();
                        },
                        icon: Icon(Icons.close)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Text('Search Filter')
                  ],
                )
              ],
            ),
          );
        });
  }
}
