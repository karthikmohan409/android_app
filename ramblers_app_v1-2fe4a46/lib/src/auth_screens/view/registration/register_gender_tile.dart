import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/font_palette.dart';

class RegisterGenderTile extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  const RegisterGenderTile({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            StringConsts.instance.gender,
            style: FontPalette.black22Regular,
          ),
          ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, value, child) {
              return Wrap(
                alignment: WrapAlignment.start,
                children: [
                  _RadioTile(
                    title: StringConsts.instance.male,
                    isSelected: value == 0,
                    onTap: () => selectedIndex.value = 0,
                  ),
                  _RadioTile(
                    title: StringConsts.instance.female,
                    isSelected: value == 1,
                    onTap: () => selectedIndex.value = 1,
                  ),
                  _RadioTile(
                    title: StringConsts.instance.others,
                    isSelected: value == 2,
                    onTap: () => selectedIndex.value = 2,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class RegisterGenderTileTwo extends StatelessWidget {
  int? selectedIndex;
  RegisterGenderTileTwo({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            StringConsts.instance.gender,
            style: FontPalette.black22Regular,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              _RadioTile(
                title: StringConsts.instance.male,
                // isSelected: 0,
                onTap: () => selectedIndex = 0,
              ),
              _RadioTile(
                title: StringConsts.instance.female,
                // isSelected: value == 1,
                onTap: () => selectedIndex = 1,
              ),
              _RadioTile(
                title: StringConsts.instance.others,
                // isSelected: value == 2,
                onTap: () => selectedIndex = 2,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _RadioTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback? onTap;

  const _RadioTile(
      {Key? key, this.isSelected = false, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 11.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 17.r,
              width: 17.r,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5.r),
                  shape: BoxShape.circle),
              child: isSelected
                  ? Container(
                      margin: EdgeInsets.all(2.r),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    )
                  : const SizedBox.square(),
            ),
            6.horizontalSpace,
            Text(
              title,
              style: FontPalette.black_18Regular,
            ),
            36.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
