import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Models/lessonModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CourseInfoScreen extends StatefulWidget {
  CourseModel courseModel;
  CourseInfoScreen(this.courseModel);
  String VideoUrl="https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  @override
  State<CourseInfoScreen> createState() => _CourseInfoScreenState();
}


class _CourseInfoScreenState extends State<CourseInfoScreen> {
  ChewieController _controller;
  _onTapVideo(String videoUrl){
  final controller =
  VideoPlayerController.network(videoUrl);
  _controller = ChewieController(
    videoPlayerController: controller,
  );
  setState(() {
  });
  controller..initialize().then((_){
    controller.play();
    setState(() {
    });
  });

  }
Widget _playView(){
    final controller=_controller;
    if(controller!=null&&controller.videoPlayerController.value.isInitialized){
      return Chewie(controller: controller,);
    }else{
      return Center(child: Text('No Video'));
    }
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller =
    VideoPlayerController.network(widget.VideoUrl);
    _controller = ChewieController(
      videoPlayerController: controller,
    );
    setState(() {
    });
    controller..initialize().then((_){
      controller.play();
      setState(() {
      });
    });
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text('  '),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 280.h,
              color: Color.fromRGBO(255, 231, 238, 1),
              child:_playView(),
            ),
            Expanded(
              child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.courseModel.nameCou,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                                Text(
                                  '\$${widget.courseModel.price}',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20.sp),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '${widget.courseModel.noOfHours}h . ${widget.courseModel.noOfSection} Lessons',
                            style:
                            TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'About this course',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text('${widget.courseModel.description}',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey),
                                softWrap: true),
                          ),
                               Consumer<MainProvider>(builder: (context, provider, x){

                                 return  provider.allSections.length==0?Center(child: CircularProgressIndicator(),):Column(
                                children: provider.allSections
                                    .map(
                                      (e) => ExpansionTile(
                                    title: Text(e.nameSection),
                                    children: e.lesson
                                        .map((e) => ListTile(
                                      onTap: () {
                                        _onTapVideo(LessonModel.fromMap(e).vedioUrl);

                                      },
                                      title: Text(
                                        LessonModel.fromMap(e).nameLess,
                                      ),
                                      // subtitle: Text('${e.duration} min'),
                                      trailing: IconButton(
                                        icon: Icon(
                                            Icons.play_circle_filled),
                                      ),
                                    ))
                                        .toList(),
                                  ),
                                )
                                    .toList(),
                              );
                            }
                          ),
                        ]),
                  )),
            )
          ],
        ),

        // bottomSheet: BottomSheet(
        //     onClosing: () {},
        //     builder: (ctx) {
        //       return Container(
        //         width: double.infinity,
        //         height: 98.h,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             InkWell(
        //                 onTap: () {
        //                   FirestoreHelper.firestoreHelper
        //                       .addCourseToMyCourses(widget.courseModel);
        //                 },
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(10),
        //                     color: Color(0XFFFFEBF0),
        //                   ),
        //                   width: 89.w,
        //                   height: 50.h,
        //                   child: provider.favouriteList.contains(widget.courseModel) ==
        //                       true
        //                       ? Icon(
        //                     Icons.star_border,
        //                     color: Color(0xffff6905),
        //                   )
        //                       : Icon(
        //                     Icons.star_border_outlined,
        //                     color: Color(0xffff6905),
        //                   ),
        //                 )),
        //             Visibility(
        //               visible: provider.myCourseList.contains(widget.courseModel),
        //               child: Container(
        //                 width: 236.w,
        //                 height: 50.h,
        //                 child: ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(10))),
        //                   onPressed: () {
        //                     FirestoreHelper.firestoreHelper
        //                         .addCourseToFaviret(widget.courseModel);
        //                   },
        //                   child: Text('Buy Now'),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     }),

        //   onPressed: () {
        //     setState(() {
        //       controller.value.isPlaying ? controller.pause() : controller.play();
        //     });
        //   },
        //   child: Icon(
        //     controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      );

  }
}

