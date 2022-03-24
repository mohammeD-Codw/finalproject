import 'package:final_project/Models/lessonModel.dart';

class SectionModel {
  String nameSection;
  List<dynamic> lessons;
  double duration;
  int noOfLesson;
  List<dynamic> lesson;

  SectionModel({
    this.nameSection,
    this.lessons,
  });
  SectionModel.fromMap(Map map) {
    nameSection = map['nameSection'];
    lesson=map['Lesson'];
  }
  // {
  //   this.noOfLesson = lessons.length;
  //   for (int x=0; x < lessons.length; x++) {
  //     this.duration += lessons[x].duration;
  //   }
  // }
}
