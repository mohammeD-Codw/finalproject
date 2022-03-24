import 'package:final_project/Models/CategoryModel.dart';
import 'package:final_project/Models/CoursesModel.dart';
import 'package:final_project/Models/SectionModel.dart';
import 'package:final_project/Models/lessonModel.dart';
import 'package:flutter/material.dart';

List<CategoryModel> listCat = [
  CategoryModel(
    'Design',
    color: Color.fromRGBO(239, 224, 225, 1),
  ),
  CategoryModel(
    'Painting',
    color: Color.fromRGBO(206, 236, 254, 1),
  ),
  CategoryModel(
    'Coding',
    color: Color.fromRGBO(186, 224, 219, 1),
  ),
  CategoryModel(
    'Music',
    color: Color.fromRGBO(186, 214, 225, 1),
  ),
  CategoryModel(
    'Visual identiy',
    color: Color.fromRGBO(255, 231, 238, 1),
  ),
  CategoryModel(
    'Mathmatics',
    color: Color.fromRGBO(251, 255, 224, 1),
  ),
];
List<SectionModel> sectionList = [
  SectionModel(nameSection: 'Introduction', lessons: [
    LessonModel(nameLess: 'Welcome to the Course', duration: 50),
    LessonModel(nameLess: 'Process overview', duration: 30),
    LessonModel(nameLess: 'Discovery', duration: 10),
  ]),
  SectionModel(nameSection: 'Introduction2', lessons: [
    LessonModel(nameLess: 'Welcome to the Course', duration: 50),
    LessonModel(nameLess: 'Process overview', duration: 30),
    LessonModel(nameLess: 'Discovery', duration: 10),
  ]),
  SectionModel(nameSection: 'Introduction3', lessons: [
    LessonModel(nameLess: 'Welcome to the Course', duration: 50),
    LessonModel(nameLess: 'Process overview', duration: 30),
    LessonModel(nameLess: 'Discovery', duration: 10),
  ]),
];
List<CourseModel> courseList = [
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Design',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Painting',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Coding',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Music',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Mathmatics',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Coding',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Design',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Mathmatics',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Music',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Design',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Painting',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Coding',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Music',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Mathmatics',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Design',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Painting',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Coding',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Music',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Java Development',
    trainerCou: 'Nguyen Shane',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10310278/pexels-photo-10310278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Mathmatics',
    ),
  ),
  CourseModel(
    nameCou: 'Visual Design',
    trainerCou: 'Bert Pullman',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10725908/pexels-photo-10725908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
  CourseModel(
    nameCou: 'Product Design v1.0',
    trainerCou: 'Robertson Connie',
    price: 190,
    noOfHours: 16,
    imageUrl:
        'https://images.pexels.com/photos/10430980/pexels-photo-10430980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    description:
        'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
    listSection: sectionList,
    categoryModel: CategoryModel(
      'Visual identiy',
    ),
  ),
];
