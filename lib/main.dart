import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/MainScreen.dart';
import 'package:final_project/Screens/SplashScreen/Splash.dart';
import 'package:final_project/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainProvider()),
        ],
        child: ScreenUtilInit(
          designSize: Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: RouterClass.routerClass.navKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },
            theme: ThemeData(
              // This is the theme of your application.
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MainProvider>(RouterClass.routerClass.navKey.currentContext,listen: false).getUserFromFirebase();

}
  @override
  Widget build(BuildContext context) {
        if (Provider.of<MainProvider>(context,listen: false).userLogged != null) {
          Provider.of<MainProvider>(context,listen: false).getMyCourses();
          Provider.of<MainProvider>(context,listen: false).getFavouriteCourses();
      return RouterClass.routerClass.pushReplacementToScreen(MainScreen());

    } else {
      return SplashScreen();
    }
    // return MainScreen();
  }
}
