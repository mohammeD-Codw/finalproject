import 'package:final_project/Providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor:Color.fromRGBO(240, 240, 242, 1),
        centerTitle: true,
        title: Text(
          'phone'.tr(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Color.fromRGBO(240, 240, 242, 1),
            height: 200.h,
            child: Image.asset('assets/images/img_1.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'enter_phone_num'.tr(),
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 70.h,
              width: 327.w,
              // padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon:Container(
                    height: 70.h,
                    width: 124.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'continue'.tr(),
                          style: TextStyle(fontSize: 16.sp),
                        )),
                  ) ,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),),
                controller:
                    Provider.of<MainProvider>(context).phoneController,
              ),
            ),
          )
        ],
      ),
    );
  }
}
