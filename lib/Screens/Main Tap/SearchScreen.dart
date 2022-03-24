import 'package:final_project/Data/data.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Widgets/BottomSheet.dart';
import 'package:final_project/Widgets/CourseWidget.dart';
import 'package:final_project/Widgets/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(15.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              controller: provider.searchController,
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(224, 243, 253, 0.4),
                  filled: true,
                  hintText: 'Find  Course',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {provider.onChangeBoSheetValue();}, icon: Icon(Icons.filter_list))),
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(children: listCat.map((e) => SearchWidget(e))
                    .toList(),)),
            const Text('Results',style:TextStyle(fontSize:18 )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: courseList.map((e) => CourseWidget(e)).toList(),
                  ),
                ),
              ),
            ),


          ]),
        ),
        bottomSheet: Visibility(visible:provider.boSheetValue==true,child: CustomBottomSheet()),
    );});

  }
}
