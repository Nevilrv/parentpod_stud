import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/Common/common_images.dart';
import 'package:parentpod_stud/Common/common_textstyle.dart';
import 'package:shimmer/shimmer.dart';

import '../../Common/color_helper.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  // ChatViewModel chatViewModel = Get.find();

  // @override
  // void initState() {
  //   super.initState();
  //   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   getChatUserData();
  //   // });
  // }

  // getChatUserData() async {
  //   await chatViewModel.getChatUserList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Container(
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 55.h, left: 16.w, right: 16.w, bottom: 23.h),
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
                    //       imageBuilder: (context, imageProvider) => Container(
                    //         width: 50.w,
                    //         height: 50.h,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           image: DecorationImage(
                    //               image: imageProvider, fit: BoxFit.cover),
                    //         ),
                    //       ),
                    //       progressIndicatorBuilder:
                    //           (context, url, downloadProgress) {
                    //         return Shimmer.fromColors(
                    //           baseColor: Colors.grey.withOpacity(0.4),
                    //           highlightColor: Colors.grey.withOpacity(0.2),
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
                            "student",
                            style: TextStyleHelper.whiteGrey14w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    SvgPicture.asset(
                      AppImage.helloSvg,
                      height: 25.h,
                    ),
                    const Spacer(),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(Icons.maps_ugc_outlined,
                            color: AppColor.pPrimary),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 3),
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.search,
                                    color: AppColor.pPrimary),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8.h),
                                hintText: "Search here...",
                                hintStyle: TextStyleHelper.kLightGrey16w400,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xffD9D9D9)
                                          .withOpacity(0.9),
                                      width: 0.7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xffD9D9D9)
                                          .withOpacity(0.9),
                                      width: 0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 10,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => const ChatScreen(
                                          image: AppImage.studentImage,
                                          name: "Student"),
                                      transition: Transition.fadeIn);
                                },
                                child: Container(
                                  height: 85.h,
                                  color: Colors.grey.shade100,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          // ClipRRect(
                                          //   borderRadius:
                                          //       BorderRadius.circular(50.r),
                                          //   child: CachedNetworkImage(
                                          //     height: 50.h,
                                          //     width: 50.h,
                                          //     fit: BoxFit.cover,
                                          //     imageUrl:
                                          //         "${ApiRouts.baseImageUrl}${userChatListResponse.data?.chatUsers?[index].userDetails?.image}",
                                          //     imageBuilder:
                                          //         (context, imageProvider) =>
                                          //             Container(
                                          //       width: 50.w,
                                          //       height: 50.h,
                                          //       decoration: BoxDecoration(
                                          //         shape: BoxShape.circle,
                                          //         image: DecorationImage(
                                          //             image: imageProvider,
                                          //             fit: BoxFit.cover),
                                          //       ),
                                          //     ),
                                          //     progressIndicatorBuilder:
                                          //         (context, url,
                                          //             downloadProgress) {
                                          //       return Shimmer.fromColors(
                                          //         baseColor: Colors.grey
                                          //             .withOpacity(0.4),
                                          //         highlightColor: Colors.grey
                                          //             .withOpacity(0.2),
                                          //         enabled: true,
                                          //         child: Container(
                                          //           color: Colors.white,
                                          //         ),
                                          //       );
                                          //     },
                                          //     errorWidget:
                                          //         (context, url, error) =>
                                          //             Container(
                                          //       height: 50.h,
                                          //       width: 50.h,
                                          //       decoration: BoxDecoration(
                                          //         shape: BoxShape.circle,
                                          //         border: Border.all(
                                          //             color: Colors.white),
                                          //         image: const DecorationImage(
                                          //           fit: BoxFit.cover,
                                          //           image: AssetImage(
                                          //               AppImage.profileImage),
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
                                                image: AssetImage(
                                                    AppImage.studentImage),
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Student",
                                                  style: TextStyleHelper
                                                      .pBlack16w800),
                                              // Text(
                                              //     "${userChatListResponse.data?.chatUsers?[index].userDetails?.name.toString().capitalizeFirst}",
                                              //     style: TextStyleHelper
                                              //         .pBlack16w800),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              // Text(
                                              //   "${userChatListResponse.data?.chatUsers?[index].messages?.message.toString()}",
                                              //   style:
                                              //       TextStyleHelper.pGrey13w400,
                                              // ),
                                              Text(
                                                "Hye",
                                                style:
                                                    TextStyleHelper.pGrey13w400,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "4 hour ago",
                                                  style: TextStyleHelper
                                                      .pLightGrey12w600,
                                                ),
                                                Container(
                                                  height: 16.h,
                                                  width: 25.w,
                                                  margin: const EdgeInsets.only(
                                                      top: 15),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xff33CF28),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '02',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Divider(height: 30.h),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
