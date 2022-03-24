import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/MainScreen.dart';
import 'package:final_project/Screens/register/loginScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

class SingUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Form(
          key: registerFormKey,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(240, 240, 242, 1)),
                accountName: Text(
                  'Sign_up'.tr(),
                  style: TextStyle(color: Colors.black, fontSize: 32.sp),
                ),
                accountEmail: Text(
                  'Sing_up_header'.tr(),
                  style: TextStyle(
                      color: Color.fromRGBO(184, 184, 210, 1), fontSize: 12.sp),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'first_name'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.firstNameController,
                            validator: (value) => provider.nullValidator(value),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'last_name'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.lastNameController,
                            validator: (value) => provider.nullValidator(value),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'your_email'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.emailSingupController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                provider.emailValidation(value),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'password'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.passwordSingupController,
                            validator: (value) =>
                                provider.passwordValidator(value),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  provider.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: provider.togglePasswordStatus,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'confirm_password'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.confirmPasswordController,
                            validator: (value) =>
                                provider.confirmPasswordValidator(value,
                                    provider.confirmPasswordController.text),
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
                      SizedBox(height: 15.h),
                      Text(
                        'your_phone'.tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 151, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SizedBox(
                          height: 60.h,
                          child: TextFormField(
                            controller: provider.phoneController,
                            validator: (value) => provider.nullValidator(value),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CheckboxListTile(
                        value: provider.valueCheckbox,
                        onChanged: (value) {
                          provider.onPressedCheckbox(value);
                        },
                        title: Text(
                          'checkbox_title'.tr(),
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color.fromRGBO(133, 133, 151, 1)),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          width: double.infinity,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.register();
                            },
                            child: Text(
                              'create_account'.tr(),
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                          )),
                      TextButton(
                          onPressed: () {
                            RouterClass.routerClass
                                .pushReplacementToScreen(LoginScreen());
                          },
                          child: Text(
                            'already_account'.tr(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromRGBO(133, 133, 151, 1)),
                          ))
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
