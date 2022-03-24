import 'dart:ui';

import 'package:final_project/Models/UserModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/MyCourseScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context,provider,x) {
          return Scaffold(
          appBar: AppBar(),
            body:
            Stack(
          children: [
                UserAccountsDrawerHeader(),
                SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, ${Provider.of<MainProvider>(context).userLogged.firstName}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          CircleAvatar(
                            backgroundImage:provider.userLogged.imageUrl!=null? NetworkImage(provider.userLogged.imageUrl):null,

                            radius:23 ,
                            ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Lets start learning',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                        height: 115.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  color: Colors.grey.shade200,
                                  blurRadius: 20,
                                  spreadRadius: 1)
                            ],
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Learned today',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text('My Courses',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.blue)),
                                )
                              ],
                            ),
                            Container(
                                width: 104.w,
                                height: 27.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('46 min', style: TextStyle(fontSize: 20.sp)),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Text('/46 min',
                                          style: TextStyle(
                                              fontSize: 10.sp, color: Colors.grey)),
                                    )
                                  ],
                                )),
                            GradientProgressIndicator(
                              gradient: Gradients.buildGradient(
                                  Alignment.bottomLeft, Alignment.topRight, [
                                Colors.grey.shade200,
                                Color.fromRGBO(225, 105, 5, 1)
                              ]),
                              value: 0.6,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 249.w,
                                height: 154.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(206, 236, 254, 1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "What do you\n want to learn\n today ?",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          Container(
                                              width: 85.w,
                                              height: 31.h,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color.fromRGBO(
                                                          225, 105, 5, 1)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Get Started',
                                                    style: TextStyle(fontSize: 12.sp),
                                                  )))
                                        ],
                                      ),
                                    ),
                                    Image.asset('assets/images/Group 130.png')
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/illustration2.png'),
                                ),
                                width: 249.w,
                                height: 154.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(206, 236, 254, 1),
                                )),
                          ],
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Text(
                        'Learning Plan',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    color: Colors.grey.shade200,
                                    blurRadius: 20,
                                    spreadRadius: 1)
                              ],
                              color: Colors.white),
                          width: 335.w,
                          child: Column(
                            children: [
                              _listTile(),
                              _listTile(),
                              _listTile(),
                              _listTile(),
                              _listTile(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Container(
                        width: 335.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 224, 255, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Meetup',
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        color: Color.fromRGBO(68, 6, 135, 1)),
                                  ),
                                  Text(
                                    'Off-line exchange of learning\n experiences',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color.fromRGBO(68, 6, 135, 1)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 150.w,
                              height: 100.h,
                              child: Stack(
                                children: [
                                  Positioned(child: Image.asset('assets/images/Group 136.png'),left: 55.w,),
                                  Positioned(child: Image.asset('assets/images/Avatar 03.png'),top:30.h,left: 40.w,),
                                  Positioned(child: Image.asset('assets/images/Group 137.png'),top:30.h ,left: 85.w,)

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
      }
    );
          }
  }

  Widget _listTile() {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Container(
          child: CircularProgressIndicator(
            value: 0.8,
            color: Colors.grey.shade600,
            backgroundColor: Colors.grey.shade200,
            semanticsLabel: 'Linear progress indicator',
          ),
          width: 20.w,
          height: 24.h,
          alignment: Alignment.center,
        ),
        title: Text(
          'Packaging Design',
          style: TextStyle(fontSize: 14.sp),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('24'),
            Text(
              '/48',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

