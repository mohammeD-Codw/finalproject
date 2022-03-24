import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Models/SectionModel.dart';
import 'package:final_project/Models/UserModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  createUserInFs(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toMap());
  }

  Future<UserModel> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    UserModel gdUser = UserModel.fromMap(userData);
    return gdUser;
  }

  getAllCourses() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('Course').get();
    List<CourseModel> allCourses = querySnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      CourseModel courseModel = CourseModel.fromMap(documentMap);
      return courseModel;
    }).toList();
    return allCourses;
  }

  Future<CourseModel> getOneCourse(String courseId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('Course').doc(courseId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    CourseModel courseModel = CourseModel.fromMap(productMap);
    return courseModel;
  }

  getFavouriteCourses() async {
    String myId = FirebaseAuth.instance.currentUser.uid;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection('users')
        .doc(myId)
        .collection('favourite')
        .get();
    List<CourseModel> favoriteCourses = querySnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      CourseModel courseModel = CourseModel.fromMap(documentMap);
      return courseModel;
    }).toList();
    return favoriteCourses;
  }

  getMyCourses() async {
    String myId = FirebaseAuth.instance.currentUser.uid;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection('users')
        .doc(myId)
        .collection('myCourse')
        .get();
    List<CourseModel> myCourses = querySnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      CourseModel courseModel = CourseModel.fromMap(documentMap);
      return courseModel;
    }).toList();
    return myCourses;
  }

  Future<List<SectionModel>> getAllSection(String courseId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection('Course')
        .doc(courseId)
        .collection('Section')
        .get();
    List<SectionModel> allSections = querySnapshot.docs.map((e) {
      Map documentMap = e.data();
      SectionModel sectionModel = SectionModel.fromMap(documentMap);
      return sectionModel;
    }).toList();
    return allSections;
  }

  addCourseToFaviret(CourseModel courseModel) async {
    //Get id user
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('favourite')
        .doc(courseModel.id)
        .set(courseModel.toMap());
  }

  addCourseToMyCourses(CourseModel courseModel) async {
    //Get id user
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('myCourse')
        .doc(courseModel.id)
        .set(courseModel.toMap());
  }
  // editProduct(Product newProduct) async {
  //   await firebaseFirestore
  //       .collection('products')
  //       .doc(newProduct.id)
  //       .update(newProduct.toMap());
  // }
}
