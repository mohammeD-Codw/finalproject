import 'package:flutter/material.dart';

class RouterClass {
  RouterClass._();

  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushToScreen(Widget widget) {
    BuildContext ctx = navKey.currentContext;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navKey.currentState.push(MaterialPageRoute(
        builder: (context) => widget,
      ));
    });
    // navKey.currentState.push(MaterialPageRoute(builder: (ctx) {
    //   return widget;
    // }));
  }

  pushToNameScreen(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }

  pushReplacementToScreen(Widget widget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BuildContext ctx = navKey.currentContext;
      navKey.currentState.pushReplacement(MaterialPageRoute(builder: (ctx) {
        return widget;
      }));
    });
  }

  popFunction() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navKey.currentState.pop();
    });
  }
  //
  // Map<String, Widget Function(BuildContext)> map = {
  //   'screen1': (context) => Page1(),
  //   'screen2': (context) => Page2(),
  // };
}
