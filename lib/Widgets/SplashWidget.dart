import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Models/splashModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/register/loginScreen.dart';
import 'package:final_project/Screens/register/signUpScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashWidget extends StatelessWidget {
  SplashModel splashModel;

  SplashWidget(this.splashModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        //  mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 260.w,
            height: 260.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                splashModel.image,
                width: 270.w,
              ),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            splashModel.text1,
            style: TextStyle(fontSize: 22.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            splashModel.text2,
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 80,
          ),
          Visibility(
              visible: Provider.of<MainProvider>(context, listen: false)
                          .indexSplash ==
                      2
                  ? true
                  : false,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 150.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          RouterClass.routerClass.pushToScreen(SingUpScreen());
                        },
                        child: Text('Sign_up'.tr()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 150.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          RouterClass.routerClass.pushToScreen(LoginScreen());
                        },
                        child: Text(
                          'Log_in'.tr(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
