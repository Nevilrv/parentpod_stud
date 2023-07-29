import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parentpod_stud/Common/color_helper.dart';
import 'package:parentpod_stud/Common/common_images.dart';
import 'package:parentpod_stud/Common/common_textstyle.dart';
import 'package:parentpod_stud/Common/common_widgets.dart';
import 'package:parentpod_stud/Common/list.dart';
import 'package:parentpod_stud/Controller/homework_controller.dart';

class SubmitHomeWork extends StatefulWidget {
  const SubmitHomeWork({Key? key}) : super(key: key);

  @override
  State<SubmitHomeWork> createState() => _SubmitHomeWorkState();
}

class _SubmitHomeWorkState extends State<SubmitHomeWork> {
  HomeWorkController homeWorkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeWorkController>(
      builder: (controller) {
        return Scaffold(
          body: SizedBox(
            height: Get.height,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 170.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.pPrimary,
                        const Color(0xff0EC3D8),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 45.h, left: 16.h, right: 16.w, bottom: 20.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    controller.clearController();
                                  },
                                  child: Image.asset(
                                    AppImage.backArrowImage,
                                    width: 15.h,
                                    height: 20.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.h,
                              ),
                              SizedBox(
                                height: 52.h,
                                child: Center(
                                  child: Text(
                                    'Submit Homework',
                                    style: TextStyleHelper.pWhite22w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 130.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    child: Container(
                      height: Get.height,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),

                          CommonWidgets.commonContainer(
                            label: 'Class',
                            suffix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: DropdownButton(
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                underline: const SizedBox(),
                                icon: RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20.h,
                                    color: AppColor.pLightGrey,
                                  ),
                                ),
                                menuMaxHeight: 400.h,
                                hint: Row(
                                  children: [
                                    Text(
                                        controller.className.isEmpty
                                            ? 'Select Class'
                                            : controller.className,
                                        style: controller.className.isEmpty
                                            ? TextStyleHelper.kLightGrey16w400
                                            : TextStyleHelper.kBlack16w400),
                                  ],
                                ),
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                items: ListCollection().tempClassList.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value1) async {
                                  setState(() {
                                    controller.className = value1!;
                                  });
                                },
                              ),
                            ),
                          ),
                          CommonWidgets.commonContainer(
                            label: 'Section',
                            suffix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: DropdownButton(
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                underline: const SizedBox(),
                                icon: RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20.h,
                                    color: AppColor.pLightGrey,
                                  ),
                                ),
                                hint: Row(
                                  children: [
                                    Text(
                                      controller.sectionName.isEmpty
                                          ? 'Select Section'
                                          : controller.sectionName,
                                      style: controller.sectionName.isEmpty
                                          ? TextStyleHelper.kLightGrey16w400
                                          : TextStyleHelper.kBlack16w400,
                                    ),
                                  ],
                                ),
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                items: ListCollection().tempSectionList.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value1) {
                                  setState(() {
                                    controller.sectionName = value1!;
                                  });
                                },
                              ),
                            ),
                          ),
                          CommonWidgets.commonContainer(
                            label: 'Subject',
                            suffix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: DropdownButton(
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                underline: const SizedBox(),
                                icon: RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20.h,
                                    color: AppColor.pLightGrey,
                                  ),
                                ),
                                hint: Row(
                                  children: [
                                    Text(
                                      controller.subjectName.isEmpty
                                          ? 'Select Subject'
                                          : controller.subjectName,
                                      style: controller.subjectName.isEmpty
                                          ? TextStyleHelper.kLightGrey16w400
                                          : TextStyleHelper.kBlack16w400,
                                    ),
                                  ],
                                ),
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                items: ListCollection().subjects.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value1) {
                                  setState(() {
                                    controller.subjectName = value1!;
                                  });
                                },
                              ),
                            ),
                          ),
                          CommonWidgets.commonContainer(
                            label: 'Homework Date',
                            suffix: GestureDetector(
                              onTap: () async {
                                controller.assignDate(context: context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(controller.homeWorkDate),
                                      style: TextStyleHelper.kBlack16w400,
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: 20.h,
                                      color: AppColor.pLightGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CommonWidgets.commonContainer(
                            label: 'Submission Date',
                            suffix: GestureDetector(
                              onTap: () async {
                                controller.submitDate(context: context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(controller.submissionDate),
                                      style: TextStyleHelper.kBlack16w400,
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: 20.h,
                                      color: AppColor.pLightGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          TextFormField(
                            controller: controller.descriptionController,
                            cursorColor: Colors.black,
                            maxLines: 10,
                            minLines: 3,
                            autofocus: true,
                            style: TextStyleHelper.kBlack16w400,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 12.h),
                              labelText: 'Description',
                              hintText: 'Type here...',
                              hintStyle: TextStyle(
                                color: AppColor.pLightGrey,
                                fontSize: 16.sp,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.pLightGrey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.pLightGrey)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.pLightGrey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: AppColor.pLightGrey)),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          /// UPLOAD PHOTO

                          Text(
                            'Upload Picture',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              //  controller.getImageFromGallery();
                            },
                            child: DottedBorder(
                              radius: Radius.circular(10.r),
                              dashPattern: const [7, 3, 7, 3],
                              strokeWidth: 1,
                              color: Colors.grey,
                              child: Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: controller.imageFile == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppImage.gallerySvg),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            'Choose Picture\nTo Upload',
                                            style: TextStyle(
                                              color: AppColor.pLightGrey,
                                              fontSize: 10.sp,
                                            ),
                                          )
                                        ],
                                      )
                                    : Image.file(controller.imageFile!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () async {},
            child: Container(
              height: 58.h,
              width: double.infinity,
              margin: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: AppColor.pPrimary,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(AppImage.sendImage,
                        height: 20.h, width: 20.w),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Submit',
                    style: TextStyleHelper.pWhite18w400
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<dynamic> popUpDialog() {
  //   return Get.generalDialog(
  //     barrierDismissible: true,
  //     barrierLabel: "",
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return StatefulBuilder(
  //         builder: (context, setState12) {
  //           return AlertDialog(
  //             backgroundColor: Colors.white,
  //             insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
  //             contentPadding: EdgeInsets.all(12.h),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15.r)),
  //             content: SizedBox(
  //               width: 300.w,
  //               child: Padding(
  //                 padding: EdgeInsets.all(15.w),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Image.asset(AppImage.splashImage, height: 80.h),
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
  //                       child: Text(
  //                         'Do you want to add more subject homework?',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyleHelper.pBlacks22w500,
  //                       ),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: GestureDetector(
  //                             onTap: () async {
  //                               Get.back();
  //                               Get.back();
  //                             },
  //                             child: Container(
  //                               margin: EdgeInsets.only(right: 10.w),
  //                               height: 50.h,
  //                               decoration: BoxDecoration(
  //                                 border: Border.all(color: AppColor.pPrimary),
  //                                 color: Colors.white,
  //                                 borderRadius: BorderRadius.circular(30.r),
  //                               ),
  //                               child: Center(
  //                                 child: Text(
  //                                   'No',
  //                                   style: TextStyleHelper.pWhite18w700
  //                                       .copyWith(color: AppColor.pPrimary),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: GestureDetector(
  //                             onTap: () async {
  //                               controller.descriptionController.clear();
  //                               //subjectModel = null;
  //                               setState12(() {});
  //                               setState(() {});
  //                               Get.back();
  //                             },
  //                             child: Container(
  //                               height: 50.h,
  //                               decoration: BoxDecoration(
  //                                 color: AppColor.pPrimary,
  //                                 borderRadius: BorderRadius.circular(30.r),
  //                               ),
  //                               child: Center(
  //                                 child: Text('Yes',
  //                                     style: TextStyleHelper.pWhite18w700),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
  //       child: FadeTransition(
  //         opacity: anim1,
  //         child: child,
  //       ),
  //     ),
  //   );
  // }
}
