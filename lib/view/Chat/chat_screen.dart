import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parentpod_stud/Common/color_helper.dart';
import 'package:parentpod_stud/Common/common_images.dart';
import 'package:parentpod_stud/Common/common_textstyle.dart';
import 'package:parentpod_stud/Common/list.dart';
import 'package:shimmer/shimmer.dart';

class ChatScreen extends StatefulWidget {
  final String? image;
  final String? name;

  const ChatScreen({super.key, this.image, this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  TextEditingController message = TextEditingController();

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
                    InkResponse(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        AppImage.backArrowImage,
                        width: 15.h,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: CachedNetworkImage(
                        height: 50.h,
                        width: 50.h,
                        fit: BoxFit.cover,
                        imageUrl: "${widget.image}",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.4),
                            highlightColor: Colors.grey.withOpacity(0.2),
                            enabled: true,
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) => Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            // border: Border.all(color: Colors.white),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImage.studentImage),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    SizedBox(
                      height: 52.h,
                      child: Center(
                        child: Text(
                          "${widget.name}",
                          style: TextStyleHelper.pWhite20w500,
                        ),
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
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Text("Today",
                                    style: TextStyleHelper.pLightGrey12w500),
                              ),
                              ListView.builder(
                                reverse: false,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ListCollection().dummyChat.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return index % 2 == 0
                                      ? Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 25.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                child: CachedNetworkImage(
                                                  height: 54.h,
                                                  width: 54.h,
                                                  fit: BoxFit.cover,
                                                  imageUrl: "${widget.image}65",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    width: 54.w,
                                                    height: 54.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                          downloadProgress) {
                                                    return Shimmer.fromColors(
                                                      baseColor: Colors.grey
                                                          .withOpacity(0.4),
                                                      highlightColor: Colors
                                                          .grey
                                                          .withOpacity(0.2),
                                                      enabled: true,
                                                      child: Container(
                                                        color: Colors.white,
                                                      ),
                                                    );
                                                  },
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    height: 54.h,
                                                    width: 54.h,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      // border: Border.all(color: Colors.white),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            AppImage
                                                                .studentImage),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 220.w,
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                              horizontal: 25.w),
                                                      margin: EdgeInsets.only(
                                                        bottom: 5.h,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColor.pWhiteGrey,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50.r),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50.r),
                                                          topRight:
                                                              Radius.circular(
                                                                  50.r),
                                                        ),
                                                      ),
                                                      child: Text(
                                                          ListCollection()
                                                              .dummyChat[index],
                                                          maxLines: 100,
                                                          style: TextStyleHelper
                                                              .pBlack18w500),
                                                    ),
                                                  ),
                                                  Text(
                                                    "15 min, ago",
                                                    style: TextStyleHelper
                                                        .pLightGrey12w600,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 25.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 220.w,
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                              horizontal: 25.w),
                                                      margin: EdgeInsets.only(
                                                        bottom: 5.h,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColor.pPrimary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50.r),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50.r),
                                                          topLeft:
                                                              Radius.circular(
                                                                  50.r),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        ListCollection()
                                                            .dummyChat[index],
                                                        maxLines: 100,
                                                        style: TextStyleHelper
                                                            .pBlack18w500
                                                            .copyWith(
                                                                color: AppColor
                                                                    .pWhite),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "15 min, ago",
                                                    style: TextStyleHelper
                                                        .pLightGrey12w600,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                child: CachedNetworkImage(
                                                  height: 54.h,
                                                  width: 54.h,
                                                  fit: BoxFit.cover,
                                                  imageUrl: "${widget.image}",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    width: 54.w,
                                                    height: 54.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                          downloadProgress) {
                                                    return Shimmer.fromColors(
                                                      baseColor: Colors.grey
                                                          .withOpacity(0.4),
                                                      highlightColor: Colors
                                                          .grey
                                                          .withOpacity(0.2),
                                                      enabled: true,
                                                      child: Container(
                                                        color: Colors.white,
                                                      ),
                                                    );
                                                  },
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    height: 54.h,
                                                    width: 54.h,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      // border: Border.all(color: Colors.white),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            AppImage
                                                                .studentImage),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                },
                              ),
                              SizedBox(
                                height: 50.h,
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.grey.shade100,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ).copyWith(bottom: 15.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: TextFormField(
                              onTap: () {
                                scrollController.jumpTo(
                                    scrollController.position.maxScrollExtent);
                              },
                              controller: message,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.h),
                                filled: true,
                                prefixIcon: Icon(Icons.emoji_emotions_outlined,
                                    color: AppColor.pLightGrey, size: 25.h),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    message.clear();
                                  },
                                  child: Image.asset(
                                    AppImage.sendImage,
                                    color: AppColor.pPrimary,
                                    scale: 3.w,
                                  ),
                                ),
                                hintText: "Type here...",
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
                      ),
                    ],
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
