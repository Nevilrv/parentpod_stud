import 'package:flutter/material.dart';
import 'package:parentpod_stud/view/HomeScreen/home_screen.dart';

import '../view/Chat/chat_list_screen.dart';
import 'common_images.dart';

class ListCollection {
  List<String> tempClassList = [
    "I STD",
    "II STD",
    "III STD",
    "IV STD",
  ];

  List<String> tempSectionList = [
    "A",
    "B",
  ];

  List<Map<String, dynamic>> menus = [
    {
      'icons': "assets/images/svg/home.svg",
      'title': 'HOME',
      'screen': const HomeScreen()
    },
    {
      'icons': "assets/images/svg/student.svg",
      'title': 'STUDENT',
      'screen': const SizedBox()
    },
    {
      'icons': "assets/images/svg/chat.svg",
      'title': 'CHAT',
      'screen': const ChatListScreen()
    },
    {
      'icons': "assets/images/svg/more.svg",
      'title': 'MORE',
      'screen': const SizedBox()
    },
  ];

  List<Map<String, dynamic>> dashBoard = [
    {
      "name": "Attendance",
      "image": AppImage.attendenceSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Homework",
      "image": AppImage.homeworkSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Bus Location",
      "image": AppImage.busSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Activities",
      "image": AppImage.activitySvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Result",
      "image": AppImage.resultSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Fees",
      "image": AppImage.feesSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Hotel Rooms",
      "image": AppImage.hostelSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Lesson Plan",
      "image": AppImage.lessonSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Online Courses",
      "image": AppImage.onlineSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Library",
      "image": AppImage.libraraySvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Live Classes",
      "image": AppImage.liveSvg,
      "screen": const SizedBox(),
    },
    {
      "name": "Notice Board",
      "image": AppImage.noticeSvg,
      "screen": const SizedBox(),
    },
  ];

  List<String> subjects = [
    'All Subjects',
    'English',
    'Mathematics',
    'Geography',
    'History'
  ];

  List<Map<String, dynamic>> personalInfo = [
    {
      "title": "Department",
      "data": "Dummy",
      "image": Icons.apps,
    },
    {
      "title": "Designation",
      "data": "Principal",
      "image": Icons.contacts_outlined,
    },
    {
      "title": "Address",
      "data": "Opp. Airport, Harni Road, Opp. Airport...",
      "image": Icons.location_on_outlined,
    },
    {
      "title": "Contact Number",
      "data": "+91 1234512345",
      "image": Icons.settings_phone_outlined,
    },
    {
      "title": "Experience",
      "data": "7 Year",
      "image": Icons.folder_special_outlined,
    },
    {
      "title": "Submission Date",
      "data": "19 July 2023",
      "image": Icons.calendar_today,
    },
  ];

  List<String> dummyChat = [
    "On the way!",
    "What about your new admission?",
    "Talk today, Will update you today",
    "Okay",
    "Yes",
    "Admission confirm or not?",
    "On the way!",
    "What about your new admission?",
    "Talk today, Will update you today",
    "Okay",
    "Yes",
    "Admission confirm or not?",
  ];

  List<Map<String, dynamic>> subject = [
    {'subjectName': 'Social Science', 'image': AppImage.sub1Image},
    {'subjectName': 'Mathematics', 'image': AppImage.sub2Image},
    {'subjectName': 'English', 'image': AppImage.sub3Image},
    {'subjectName': 'Geography', 'image': AppImage.sub4Image},
    {'subjectName': 'History', 'image': AppImage.sub5Image},
  ];

  List<IconData> attendance = const [
    Icons.done,
    Icons.close,
    Icons.schedule,
    Icons.hourglass_bottom,
  ];
}
