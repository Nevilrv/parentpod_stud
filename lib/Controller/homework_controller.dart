import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeWorkController extends GetxController {
  File? imageFile;
  String className = '';
  String sectionName = '';
  String subjectName = '';
  TextEditingController descriptionController = TextEditingController();
  DateTime homeWorkDate = DateTime.now();

  DateTime submissionDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  clearController() {
    imageFile = null;
    homeWorkDate = DateTime.now();
    submissionDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  }

  /// ASSIGN HOMEWORK DATE

  Future assignDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: homeWorkDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != homeWorkDate) {
      homeWorkDate = picked;
      update();
    }
  }

  /// ASSIGN SUBMIT DATE

  Future submitDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: homeWorkDate,
      firstDate: homeWorkDate,
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != submissionDate) {
      submissionDate = picked;
      update();
    }
  }

  /// GET IMAGE FROM GALLERY

  Future getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    update();
  }
}
