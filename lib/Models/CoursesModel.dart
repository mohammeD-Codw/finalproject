import 'package:final_project/Models/CategoryModel.dart';
import 'package:final_project/Models/SectionModel.dart';
import 'package:final_project/Models/lessonModel.dart';

class CourseModel {
  String id;
  String nameCou;
  String trainerCou;
  int price;
  int noOfHours;
  int noOfSection;
  String imageUrl;
  double rate;
  String description;
  List<SectionModel> listSection;
  CategoryModel categoryModel;

  CourseModel(
      {this.nameCou,
      this.trainerCou,
      this.price,
      this.noOfHours,
      this.imageUrl,
      this.rate,
      this.description,
      this.listSection,
      this.categoryModel});

  CourseModel.fromMap(Map map) {
    this.id = map['id'];
    this.nameCou = map['nameCou'];
    this.description = map['description'];
    this.price = map['price'];
    this.noOfHours = map['noOfHours'];
    this.trainerCou = map['trainerCou'];
    this.listSection = map['listSection'];
  }
  toMap() {
    return {
      'nameCou': this.nameCou,
      'trainerCou': this.trainerCou,
      'price': this.price,
      'imageUrl': this.imageUrl,
      'noOfHours': this.noOfHours,
      'description': this.description,
      'listSection': this.listSection
    };
  }
  // {
  //   this.noOfSection = listSection.length;
  //   for (int x; x <= listSection.length; x++) {
  //     onOfHours =onOfHours+ listSection[x].duration;
  //   }
  //  }
}
