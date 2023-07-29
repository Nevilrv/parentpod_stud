import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/Common/common_images.dart';
import 'package:parentpod_stud/Common/common_textstyle.dart';
import 'package:parentpod_stud/Common/get_storage.dart';
import 'package:parentpod_stud/Common/list.dart';
import 'package:parentpod_stud/view/Homework/homework_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../Common/color_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Stack(
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     // Get.to(() => const ProfileScreen(),
                          //     //     transition: Transition.fadeIn);
                          //   },
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(50.r),
                          //     child: CachedNetworkImage(
                          //       height: 50.h,
                          //       width: 50.h,
                          //       fit: BoxFit.cover,
                          //       imageUrl:
                          //           "https://nfes.parentpod.in/${SharedPreference.getImage()}",
                          //       imageBuilder: (context, imageProvider) =>
                          //           Container(
                          //         width: 50.w,
                          //         height: 50.h,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           image: DecorationImage(
                          //               image: imageProvider,
                          //               fit: BoxFit.cover),
                          //         ),
                          //       ),
                          //       progressIndicatorBuilder:
                          //           (context, url, downloadProgress) {
                          //         return Shimmer.fromColors(
                          //           baseColor: Colors.grey.withOpacity(0.4),
                          //           highlightColor:
                          //               Colors.grey.withOpacity(0.2),
                          //           enabled: true,
                          //           child: Container(
                          //             color: Colors.white,
                          //           ),
                          //         );
                          //       },
                          //       errorWidget: (context, url, error) => Container(
                          //         height: 50.h,
                          //         width: 50.h,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           border: Border.all(color: Colors.white),
                          //           image: const DecorationImage(
                          //             fit: BoxFit.cover,
                          //             image: AssetImage(AppImage.profileImage),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AppImage.profileImage),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          SizedBox(
                            height: 52.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Test Account",
                                  style: TextStyleHelper.pWhite20w500,
                                ),
                                Text(
                                  "Student",
                                  style: TextStyleHelper.whiteGrey14w500,
                                ),
                                // Text(
                                //   "${SharedPreference.getUsername()}",
                                //   style: TextStyleHelper.pWhite20w500,
                                // ),
                                // Text(
                                //   "${SharedPreference.getRoleKey() ?? ""}",
                                //   style: TextStyleHelper.whiteGrey14w500,
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          SvgPicture.asset(
                            "assets/images/svg/Hello.svg",
                            height: 25.h,
                          ),
                          const Spacer(),
                          Container(
                            height: 50.h,
                            width: 50.h,
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
                      Wrap(
                        children: List.generate(
                          ListCollection().dashBoard.length,
                          (index) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (index == 0) {
                                // Get.to(() => const AttendanceScreen(),
                                //     transition: Transition.fadeIn);
                              }
                              if (index == 1) {
                                Get.to(() => const HomeWorkScreen(),
                                    transition: Transition.fadeIn);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              width: 122.w,
                              height: 110.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ListCollection().dashBoard[index]["image"],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    ListCollection().dashBoard[index]["name"],
                                    style: TextStyleHelper.pBlack14w800,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Upcoming Holiday's",
                            style: TextStyleHelper.pBlacks22w500),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 30.h),
                          height: 70.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImage.eventBGImage),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppImage.eventCalenderImage,
                                  height: 46.h),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Good Friday',
                                style: TextStyleHelper.pWhite18w400,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
