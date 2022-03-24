import 'package:flutter/material.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String phone;
  String address;
  String email;
  String password;
  bool isAdmin;
  List<dynamic> favouriteList;
  List<dynamic> myCourseList;
  String imageUrl;

  UserModel({
    this.id,
    this.imageUrl,
    @required this.firstName,
    @required this.lastName,
    @required this.phone,
    @required this.address,
    @required this.email,
    @required this.password,
  });
  UserModel.fromMap(Map map) {
    this.firstName = map['firstName'];
    this.lastName = map['lastName'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.email = map['email'];
    this.id = map['id'];
    this.imageUrl=map['imageUrl'];
  }
  toMap() {
    return {
      'favouriteList':this.favouriteList,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'password': this.password,
      'phone': this.phone,
      'address': this.address,
      'email': this.email,
      'imageUrl':this.imageUrl,
    };
  }
}
