import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/Main%20Tap/SearchScreen.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {

      return Scaffold(
          body: Center(
            child: provider.listTap.elementAt(provider.selectedIndexTap),
          ),
          floatingActionButton: Container(
            height: 75.0.h,
            width: 75.0.w,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(244, 243, 253, 1),
                onPressed: () {
                  RouterClass.routerClass.pushToScreen(SearchScreen());
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.blue,
                ),
                // elevation: 5.0,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Container(
                height: 80.h,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Column(
                        children: [
                          Icon(
                            Icons.home_filled,
                            color: provider.selectedIndexTap == 0
                                ? Colors.blue
                                : Color.fromRGBO(244, 243, 253, 1),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 8,
                              color: provider.selectedIndexTap == 0
                                  ? Colors.blue
                                  :Color.fromRGBO(244, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        provider.onItemTapped(0);
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Column(
                        children: [
                          Icon(
                            Icons.library_books_sharp,
                            color: provider.selectedIndexTap == 1
                                ? Colors.blue
                                :Color.fromRGBO(244, 243, 253, 1),
                          ),
                          Text(
                            'Course',
                            style: TextStyle(
                              fontSize: 8,
                              color: provider.selectedIndexTap == 1
                                  ? Colors.blue
                                  : Color.fromRGBO(244, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        provider.onItemTapped(1);
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Column(
                        children: [
                          Icon(
                            Icons.message,
                            color: provider.selectedIndexTap == 2
                                ? Colors.blue
                                : Color.fromRGBO(244, 243, 253, 1),
                          ),
                          Text(
                            'Message',
                            style: TextStyle(
                              fontSize: 7,
                              color: provider.selectedIndexTap == 2
                                  ? Colors.blue
                                  :Color.fromRGBO(244, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        provider.onItemTapped(2);
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: provider.selectedIndexTap == 3
                                ? Colors.blue
                                : Color.fromRGBO(244, 243, 253, 1),
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 8,
                              color: provider.selectedIndexTap == 3
                                  ? Colors.blue
                                  : Color.fromRGBO(244, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        provider.onItemTapped(3);
                      },
                    )
                  ],
                ),
              )));
    });
  }
}
