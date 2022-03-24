import 'dart:developer';
import 'dart:math';

import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Data/data.dart';
import 'package:final_project/Models/CategoryModel.dart';
import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Models/SectionModel.dart';
import 'package:final_project/Models/UserModel.dart';
import 'package:final_project/Models/lessonModel.dart';
import 'package:final_project/Models/splashModel.dart';
import 'package:final_project/Providers/auth_helper.dart';
import 'package:final_project/Providers/firestore_helper.dart';
import 'package:final_project/Screens/Main%20Tap/AccountScreen.dart';
import 'package:final_project/Screens/Main%20Tap/CourseScreen.dart';
import 'package:final_project/Screens/Main%20Tap/HomeScreen.dart';
import 'package:final_project/Screens/Main%20Tap/MessageScreen.dart';
import 'package:final_project/Screens/MainScreen.dart';
import 'package:final_project/Screens/register/loginScreen.dart';
import 'package:final_project/Screens/register/signUpScreen.dart';
import 'package:final_project/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MainProvider extends ChangeNotifier {
  int indexSplash = 0;
  int selectedIndexTap = 0;
  String selectedNameCourse = 'All';
  bool boSheetValue = false;
  TextEditingController searchController;
  bool obscureText = true;
  bool valueCheckbox = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailSingupController = TextEditingController();
  TextEditingController emailSinginController = TextEditingController();
  TextEditingController passwordSinginController = TextEditingController();
  TextEditingController passwordSingupController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  List<CourseModel> allCourses = [];
  List<SectionModel> allSections = [];
  List<CourseModel> favouriteList = [];
  List<CourseModel> myCourseList = [];
  UserModel userLogged;
  UserModel userModel;
  String videoUrl = 'iLnmTe5Q2Qw';
  LessonModel lessonModel;

  MainProvider() {
    getAllCourses();
  }
  onPressedLesson(LessonModel lessonModel) {
    this.videoUrl = lessonModel.vedioUrl;
    notifyListeners();
  }

  onChangeBoSheetValue() {
    boSheetValue = !boSheetValue;
    notifyListeners();
  }

  onIndexCourseChanged(String catName) {
    this.selectedNameCourse = catName;
    notifyListeners();
  }

  onPageChanged(int index) {
    this.indexSplash = index;
    notifyListeners();
  }

  List<SplashModel> splashList = [
    SplashModel(
      text1: 'text_splash_11'.tr(),
      text2: 'text_splash_12'.tr(),
      image: 'assets/images/splash_1.png',
    ),
    SplashModel(
      text1: 'text_splash_21'.tr(),
      text2: 'text_splash_22'.tr(),
      image: 'assets/images/splash_2.png',
    ),
    SplashModel(
      text1: 'text_splash_31'.tr(),
      text2: 'text_splash_32'.tr(),
      image: 'assets/images/splash_3.png',
    ),
  ];
  onItemTapped(int index) {
    this.selectedIndexTap = index;
    notifyListeners();
  }

  List listTap = [
    HomeScreen(),
    CourseScreen(),
    MessageScreen(),
    AccountScreen(),
  ];
  List listCourseIndex = [
    CategoryModel('All'),
    CategoryModel('Popular'),
    CategoryModel('New'),
  ];

  registerNewUser() async {
    try {
      UserModel userModel = UserModel(
        email: emailSingupController.text,
        password: passwordSingupController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
      );
      String userId = await AuthHelper.authHelper
          .createNewAccount(userModel.email, userModel.password);
      userModel.id = userId;
      FirestoreHelper.firestoreHelper.createUserInFs(userModel);
      this.userLogged = userModel;
      emailSingupController.clear();
      phoneController.clear();
      firstNameController.clear();
      lastNameController.clear();
      phoneController.clear();
      passwordSingupController.clear();
      confirmPasswordController.clear();
      getFavouriteCourses();
      getMyCourses();

      RouterClass.routerClass.pushToScreen(MainScreen());
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  loginUser() async {
    try {
      UserCredential userId = await AuthHelper.authHelper
          .signIn(emailSinginController.text, passwordSinginController.text);
      await getUserFromFirebase();
      if (userId != null) {
        emailSinginController.clear();
        passwordSinginController.clear();

        getFavouriteCourses();
        getMyCourses();

        RouterClass.routerClass.pushToScreen(MainScreen());
      }
    } catch (e) {
      print(e);
    }
  }

  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    this.userLogged =
        await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    notifyListeners();
  }

  logOut() async {
    this.userLogged = null;
    await AuthHelper.authHelper.logout();
    RouterClass.routerClass.pushReplacementToScreen(LoginScreen());
    notifyListeners();
  }

  togglePasswordStatus() {
    obscureText = !obscureText;
    notifyListeners();
  }

  onPressedCheckbox(bool value) {
    valueCheckbox = value;
    notifyListeners();
  }

  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.length < 5) {
      return 'at least 5 character';
    }
    return null;
  }

  String confirmPasswordValidator(String value, String value1) {
    if (value != value1) {
      return 'password not match';
    }
    return null;
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email syntax';
    }
  }

  register() {
    bool isSuccess = registerFormKey.currentState.validate();
    if (isSuccess) {
      registerFormKey.currentState.save();
      registerNewUser();
    }
  }

  loginVal() {
    bool isSuccess = loginFormKey.currentState.validate();
    if (isSuccess) {
      loginFormKey.currentState.save();
      RouterClass.routerClass.pushReplacementToScreen(loginUser());
    }
  }

  String validateCheckBox(v) {
    if (!v) {
      return 'you have to accept our conditions';
    }
    return null;
  }

  saveCheckBoxResult(bool x) {
    this.valueCheckbox = x;
  }

  bool isEmail(String value) {
    if (value.contains('@') && value.contains('.com')) {
      return true;
    } else {
      return false;
    }
  }

  getAllCourses() async {
    allCourses = await FirestoreHelper.firestoreHelper.getAllCourses();
    notifyListeners();
  }

  getFavouriteCourses() async {
    favouriteList = await FirestoreHelper.firestoreHelper.getFavouriteCourses();
    notifyListeners();
  }

  getMyCourses() async {
    myCourseList = await FirestoreHelper.firestoreHelper.getMyCourses();
    notifyListeners();
  }

  getAllSections(CourseModel courseModel) async {
    allSections = null;
    allSections =
        await FirestoreHelper.firestoreHelper.getAllSection(courseModel.id);
    //lessonModel = allSections[0].lesson[0];
    notifyListeners();
  }
}
