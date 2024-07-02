import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/res/widgets/app_text_field.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/utils/space_ext.dart';

class ClubExecutivesScreen extends StatelessWidget {
  const ClubExecutivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ColorPalette.bgColor,
        appBar: CustomAppBar(
          buildContext: context,
          pageTitle: "Club Executives",
        ),
        body: Column(
          children: [
            SizedBox(
              height: 45.h,
              child: TabBar(
                indicatorWeight: 5,
                automaticIndicatorColorAdjustment: false,
                // isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.fill,
                dividerColor: ColorPalette.primaryColor.withOpacity(0.5),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                labelPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(
                    text: 'Executives',
                  ),
                  Tab(
                    text: 'Captains',
                  ),
                  Tab(
                    text: 'Vice Captains',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Executies(index: 10),
                  Executies(index: 3),
                  Executies(index: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Executies extends StatelessWidget {
  const Executies({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // AppText("text"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppTextField(
              label: "",
              hint: "Current year",
              suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.black),
              readOnly: true,
              controller: TextEditingController(),
              onTap: () {},
            ),
          ),
          15.hBox,
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            physics: const ClampingScrollPhysics(),
            childAspectRatio: (2 / 2.3),
            children: List.generate(
              index,
              (index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: ColorPalette.primaryColor,
                      child: CircleAvatar(
                        radius: 47.r,
                        backgroundImage: CachedNetworkImageProvider(randomUrl),
                      ),
                    ),
                    AppText(
                      "Ethan",
                      size: 15.sp,
                      family: StringConsts.instance.din400,
                      weight: FontWeight.w700,
                    ),
                    AppText(
                      "Team A",
                      size: 12.sp,
                      family: StringConsts.instance.din400,
                      weight: FontWeight.w400,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
