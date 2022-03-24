import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/MainScreen.dart';
import 'package:final_project/Widgets/SplashWidget.dart';
import 'package:final_project/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  // FunctionSplash(context) async {
  //   await Future.delayed(Duration(seconds: 3)).then((value) =>
  //       RouterClass.routerClass.pushReplacementToScreen(SplashScreen2()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: [
          Visibility(
            visible:
                Provider.of<MainProvider>(context, listen: false).indexSplash ==
                        2
                    ? false
                    : true,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip'.tr(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      body: AspectRatio(
          aspectRatio: 16.h / 20.w,
          child: CarouselSlider(
              items: Provider.of<MainProvider>(context).splashList.map((e) {
                return SplashWidget(e);
              }).toList(),
              options: CarouselOptions(
                  pauseAutoPlayInFiniteScroll: true,
                  //pageSnapping:false,
                  height: double.infinity,
                  aspectRatio: 16.h / 9.w,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(microseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, x) {
                    Provider.of<MainProvider>(context, listen: false)
                        .onPageChanged(index);
                  }))),
    );
  }
}
