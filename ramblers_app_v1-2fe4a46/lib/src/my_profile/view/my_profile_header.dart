import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/src/my_profile/model/member_profile_model.dart';
import 'package:mississauga/src/my_profile/view_model/my_profile_view_model.dart';
import 'package:provider/provider.dart';

class MyProfileHeader extends StatelessWidget {
  const MyProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MyProfileViewModel, MemberProfileModel?>(
      selector: (context, provider) => provider.memberProfileModel,
      builder: (context, value, child) {
        return Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Container(
                    height: 86.r,
                    width: 86.r,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorPalette.primaryColor, width: 3.r),
                        shape: BoxShape.circle),
                    child: SizedBox(),
                  ),
                ),
                14.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: value?.memberProfile?.fullName,
                            style: FontPalette.black_18Bold,
                            children: [
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: Offset(0, -3.h),
                                  child: Image.asset(
                                    Assets.imagesArrowPrimary,
                                    height: 12.h,
                                    width: 17.w,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Text(
                        'User ID : ${value?.memberProfile?.userId ?? ''}',
                        style: FontPalette.black_18Bold,
                      ),
                      Text(
                        '${value?.memberProfile?.gender ?? ''} | ${value?.memberProfile?.dateOfBirth ?? ''}',
                        style: FontPalette.black16Normal,
                      )
                    ],
                  ),
                ),
                50.horizontalSpace,
              ],
            ),
            // Positioned(
            //   right: 0,
            //   child: IconButton(
            //       onPressed: () {},
            //       icon: Image.asset(
            //         Assets.imagesPencil,
            //         height: 17.h,
            //         width: 17.w,
            //       )),
            // )
          ],
        );
      },
    );
  }
}
