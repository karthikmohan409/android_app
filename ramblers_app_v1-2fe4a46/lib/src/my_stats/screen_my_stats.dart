import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';

import '../../res/widgets/custom_app_bar.dart';

class ScreenMyStats extends StatelessWidget {
  const ScreenMyStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: 'My Stats',
      ),
      backgroundColor: ColorPalette.newBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabsInScreenMyStats(
                  icon: Icons.sports_cricket,
                  title: 'Batting',
                ),
                TabsInScreenMyStats(
                  icon: Icons.circle,
                  title: 'Bowling',
                ),
                TabsInScreenMyStats(
                  icon: Icons.settings_input_composite_outlined,
                  title: 'Fielding',
                ),
              ],
            ),
            20.verticalSpace,
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: 60),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(165, 179, 88, 88),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mat', style: FontPalette.grey_16NormalSimple),
                      Text('22', style: FontPalette.black18Normal),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TabsInScreenMyStats extends StatelessWidget {
  const TabsInScreenMyStats({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorPalette.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorPalette.bgColor,
          ),
          10.verticalSpace,
          Text(
            'Batting',
            style: FontPalette.black16Bg,
          )
        ],
      ),
    );
  }
}
