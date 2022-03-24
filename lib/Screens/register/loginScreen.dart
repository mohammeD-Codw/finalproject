import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/register/phoneScreen.dart';
import 'package:final_project/Screens/register/signUpScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Form(
          key: loginFormKey,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(240, 240, 242, 1)),
                accountName: Text(
                  'Log_in'.tr(),
                  style: TextStyle(color: Colors.black, fontSize: 32.sp),
                ),
                accountEmail: Text(' '),
              ),
              Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'your_email'.tr(),
                            style: TextStyle(
                                color: Color.fromRGBO(133, 133, 151, 1)),
                          ),
                          Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            validator: (value) =>
                                provider.emailValidation(value),
                            controller: provider.emailSinginController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            'password'.tr(),
                            style: TextStyle(
                                color: Color.fromRGBO(133, 133, 151, 1)),
                          ),
                          Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            validator: (value) =>
                                provider.passwordValidator(value),
                            controller: provider.passwordSinginController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  provider.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: provider.togglePasswordStatus,
                              ),
                            ),
                            // validator: (val){
                            //   return
                            //     val.length < 6 ? 'Enter A Password Longer Than 6 Charchters' :null;
                            // },
                            obscureText: provider.obscureText,
                            // onChanged: (val){
                            //   setState(() {
                            //     password = val.trim();
                            //   });
                            // },
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                RouterClass.routerClass
                                    .pushToScreen(PhoneScreen());
                              },
                              child: Text(
                                'forgot_password'.tr(),
                                style: TextStyle(fontSize: 14.sp),
                                textAlign: TextAlign.end,
                              )),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          width: double.infinity,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.loginVal();
                            },
                            child: Text(
                              'Log_in'.tr(),
                            style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('do_not_have_account'.tr(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(133, 133, 151, 1))),
                          TextButton(
                              onPressed: () {
                                RouterClass.routerClass
                                    .pushReplacementToScreen(SingUpScreen());
                              },
                              child: Text(
                                'Sign_up'.tr(),
                                style: TextStyle(fontSize: 12.sp),
                              )),
                        ],
                      ),
                      Row(children: [
                        Expanded(child: Divider()),
                        Text(
                          'or_login_with'.tr(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color.fromRGBO(133, 133, 151, 1)),
                        ),
                        Expanded(child: Divider()),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 20,
                                child:
                                    Image.asset('assets/images/facebook.png'),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Image.asset('assets/images/google.png'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
