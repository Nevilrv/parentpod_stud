import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parentpod_stud/Common/color_helper.dart';
import 'package:parentpod_stud/Common/common_images.dart';
import 'package:parentpod_stud/Common/common_textstyle.dart';
import 'package:parentpod_stud/Common/common_widgets.dart';
import 'package:parentpod_stud/Common/list.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/customization/calendar_builders.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/customization/calendar_style.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/customization/days_of_week_style.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/customization/header_style.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/shared/utils.dart';
import 'package:parentpod_stud/Custom/custom_calendar/src/table_calendar.dart';
import 'package:parentpod_stud/view/Homework/submit_homework_screen.dart';

class HomeWorkScreen extends StatefulWidget {
  const HomeWorkScreen({super.key});

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  int select = 0;
  DateTime _selectedDate = DateTime.now();
  String className = '';
  String sectionName = '';
  String subjectName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Container(
          height: 300.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.pPrimary,
                const Color(0xff0EC3D8),
              ],
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 55.h, left: 16.w, right: 16.w, bottom: 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
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
                          'Homework',
                          style: TextStyleHelper.pWhite22w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        className = '';
                        sectionName = '';
                        subjectName = '';
                        // controller.sectionList.clear();
                        // controller.subjectList.clear();

                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setStates1) {
                                return Container(
                                  height: 400.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF8F8F8),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      topRight: Radius.circular(15.r),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CommonWidgets.commonContainer(
                                        label: 'Class',
                                        suffix: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: DropdownButton(
                                            focusColor: Colors.white,
                                            dropdownColor: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
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
                                                  className.isEmpty
                                                      ? 'Select Class'
                                                      : className,
                                                  style: className.isEmpty
                                                      ? TextStyleHelper
                                                          .kLightGrey16w400
                                                      : TextStyleHelper
                                                          .kLightGrey16w400
                                                          .copyWith(
                                                              color: AppColor
                                                                  .pGrey),
                                                ),
                                              ],
                                            ),
                                            isExpanded: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            items: ListCollection()
                                                .tempClassList
                                                .map(
                                              (value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value1) async {
                                              setStates1(() {
                                                className = value1!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      CommonWidgets.commonContainer(
                                        label: 'Section',
                                        suffix: StreamBuilder<Object>(
                                            stream: null,
                                            builder: (context, snapshot) {
                                              return StatefulBuilder(
                                                builder: (context, setStates) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: DropdownButton(
                                                      focusColor: Colors.white,
                                                      dropdownColor:
                                                          Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      underline:
                                                          const SizedBox(),
                                                      icon: RotatedBox(
                                                        quarterTurns: 3,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_back_ios_new,
                                                          size: 20.h,
                                                          color: const Color(
                                                              0xffA9A9A9),
                                                        ),
                                                      ),
                                                      hint: Row(
                                                        children: [
                                                          Text(
                                                            sectionName.isEmpty
                                                                ? 'Select Section'
                                                                : sectionName,
                                                            style: sectionName
                                                                    .isEmpty
                                                                ? TextStyleHelper
                                                                    .kLightGrey16w400
                                                                : TextStyleHelper
                                                                    .kLightGrey16w400
                                                                    .copyWith(
                                                                        color: AppColor
                                                                            .pGrey),
                                                          ),
                                                        ],
                                                      ),
                                                      isExpanded: true,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                      items: ListCollection()
                                                          .tempSectionList
                                                          .map(
                                                        (value) {
                                                          return DropdownMenuItem(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        },
                                                      ).toList(),
                                                      onChanged:
                                                          (value1) async {
                                                        setStates1(() {
                                                          sectionName = value1!;
                                                        });
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                      ),
                                      CommonWidgets.commonContainer(
                                        label: 'Subject',
                                        suffix: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: DropdownButton(
                                            focusColor: Colors.white,
                                            dropdownColor: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
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
                                                  subjectName.isEmpty
                                                      ? 'Select Subject'
                                                      : subjectName,
                                                  style: subjectName.isEmpty
                                                      ? TextStyleHelper
                                                          .kLightGrey16w400
                                                      : TextStyleHelper
                                                          .kLightGrey16w400
                                                          .copyWith(
                                                              color: AppColor
                                                                  .pGrey),
                                                ),
                                              ],
                                            ),
                                            isExpanded: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            items:
                                                ListCollection().subjects.map(
                                              (value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value1) {
                                              setStates1(() {
                                                subjectName = value1!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 56.h,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff656565),
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyleHelper
                                                      .pWhite18w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 56.h,
                                                decoration: BoxDecoration(
                                                  color: AppColor.pPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Apply',
                                                    style: TextStyleHelper
                                                        .pWhite18w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Image.asset(AppImage.filterImage,
                          height: 20.h, width: 18.w),
                    ),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      margin: EdgeInsets.only(left: 22.w),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset(AppImage.notificationSvg,
                                height: 20.h, width: 18.w),
                            Positioned(
                              right: -2.5.w,
                              top: -1.h,
                              child: CircleAvatar(
                                backgroundColor: const Color(0xff33CF28),
                                radius: 5.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffCDEEFF),
              ),

              ///Calender
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TableCalendar(
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  focusedDay: _selectedDate,
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyleHelper.pWhite16w700,
                    todayDecoration: const BoxDecoration(color: Colors.white),
                    selectedDecoration:
                        const BoxDecoration(color: Colors.white),
                    tablePadding: EdgeInsets.zero,
                    cellPadding: EdgeInsets.zero,
                  ),
                  calendarFormat: CalendarFormat.week,
                  selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontSize: 16.sp),
                    leftChevronIcon:
                        SvgPicture.asset('assets/images/svg/left_arrow.svg'),
                    rightChevronIcon:
                        SvgPicture.asset('assets/images/svg/right_arrow.svg'),
                    headerMargin: EdgeInsets.only(bottom: 10.h),
                    leftChevronPadding: EdgeInsets.zero,
                    leftChevronMargin: EdgeInsets.only(left: 15.w),
                    rightChevronMargin: EdgeInsets.only(right: 15.w),
                    rightChevronPadding: EdgeInsets.zero,
                  ),
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date.day.toString(),
                            style: TextStyleHelper.pPrimary16w700,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            DateFormat.E().format(date).toString(),
                            style: TextStyleHelper.pPrimary16w700.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    todayBuilder: (context, date, events) => Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            DateFormat.E().format(date).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;

                      log("onDaySelected--------$_selectedDate");
                    });
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle:
                        TextStyle(color: Colors.white, fontSize: 14.sp),
                    weekendStyle:
                        TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),

              ///Subject part
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              ListCollection().subjects.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    select = index;
                                  });
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  margin: EdgeInsets.only(right: 10.w),
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: index == select
                                            ? AppColor.pPrimary
                                            : AppColor.pLightGrey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      ListCollection().subjects[index],
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                          color: index == select
                                              ? AppColor.pPrimary
                                              : AppColor.pLightGrey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: ListCollection().subject.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 20.h),
                              padding: EdgeInsets.all(7.h),
                              decoration: BoxDecoration(
                                color: AppColor.pWhite,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    ListCollection().subject[index]['image'],
                                    height: 90.w,
                                    width: 90.w,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ListCollection().subject[index]
                                            ['subjectName'],
                                        style: TextStyleHelper.pWhite18w400
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 2.h),
                                        margin: EdgeInsets.only(top: 2.h),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffCDEEFF),
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        child: Text(
                                          "Submit on : 19 July 2023",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: AppColor.pPrimary,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                        width: 240.w,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          "loremmsn usbwjnjedn hsgxyuasghujw",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleHelper.whiteGrey14w500
                                              .copyWith(color: AppColor.pGrey),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.pPrimary,
        child: Center(
          child: Image.asset(AppImage.addImage, height: 22.h, width: 22.w),
        ),
        onPressed: () {
          Get.to(() => const SubmitHomeWork(), transition: Transition.fadeIn);
        },
      ),
    );
  }
}
