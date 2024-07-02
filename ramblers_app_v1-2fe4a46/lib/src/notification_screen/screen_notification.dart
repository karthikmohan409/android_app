import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/color_palette.dart';

import '../../res/style/font_palette.dart';
import '../../res/widgets/custom_app_bar.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.newBg,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: 'Notifications',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unread 2',
                    style: FontPalette.black18Normal,
                  ),
                  Text('Mark all read', style: FontPalette.primary_22Regular),
                ],
              ),
            ),
            NotificationTile(
              isRead: false,
            ),
            NotificationTile(
              isRead: false,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: false,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: false,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: true,
            ),
            NotificationTile(
              isRead: true,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NotificationTile extends StatelessWidget {
  NotificationTile({super.key, required this.isRead});
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: isRead
              ? Colors.transparent
              : const Color.fromARGB(37, 244, 67, 54)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.mail,
                  color: ColorPalette.primaryColor,
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subject title access',
                        style: FontPalette.black20RegularShade70),
                    Text('5 hours ago  |  Subtitle',
                        style: FontPalette.grey_16Normal),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert_rounded,
              size: 30,
              color: const Color.fromARGB(255, 102, 102, 102),
            )
          ],
        ),
      ),
    );
  }
}
