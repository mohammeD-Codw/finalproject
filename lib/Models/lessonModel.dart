class LessonModel {
  String nameLess;
  int duration;
  String vedioUrl;

  LessonModel({
    this.duration,
    this.nameLess,
    this.vedioUrl,

  });
  LessonModel.fromMap(Map map){
    nameLess=map['nameLess'];
    duration=map['duration'];
    vedioUrl=map['vedioUrl'];
  }
}
