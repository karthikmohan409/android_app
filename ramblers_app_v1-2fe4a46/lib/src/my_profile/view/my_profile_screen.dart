import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/src/my_profile/view/my_profile_header.dart';
import 'package:mississauga/src/my_profile/view/profile_textfield.dart';
import 'package:mississauga/src/my_profile/view_model/my_profile_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/routes/app_route.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late final TextEditingController emailCtrl;
  late final TextEditingController phoneCtrl;
  late final TextEditingController addressCtrl;
  late final TextEditingController emergencyContactNameCtrl;
  late final TextEditingController emergencyContactNumberCtrl;
  late final TextEditingController clubCtrl;
  late final TextEditingController battingStyleCtrl;
  late final TextEditingController bowlingStyleCtrl;
  late final TextEditingController fieldingPositionCtrl;
  late final MyProfileViewModel myProfileViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.newBg,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: StringConsts.instance.myProfile,
        // actionList: [
        //   // IconButton(
        //   //     onPressed: () {},
        //   //     icon: Image.asset(
        //   //       Assets.imagesSettings,
        //   //       height: 20.r,
        //   //       width: 20.r,
        //   //     )),
        //   15.horizontalSpace,
        // ],
      ),
      body: Selector<MyProfileViewModel, LoadState>(
        selector: (context, provider) => provider.loadState,
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 5.h),
            child: ListView(
              children: [
                const MyProfileHeader(),
                7.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal information',
                      style: FontPalette.primary18Normal,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.gotoEditProfile(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(164, 254, 116, 116),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(164, 254, 116, 116),
                          child: Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(165, 179, 88, 88),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        ProfileTextField(
                          labelText: StringConsts.instance.email,
                          textController: emailCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText: StringConsts.instance.phone,
                          textController: phoneCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText: StringConsts.instance.address,
                          textController: addressCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText: StringConsts.instance.emergencyContactName,
                          textController: emergencyContactNameCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText:
                              StringConsts.instance.emergencyContactNumber,
                          textController: emergencyContactNumberCtrl,
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   height: 1.h,
                //   width: double.maxFinite,
                //   color: Colors.black.withOpacity(0.2),
                //   margin: EdgeInsets.only(top: 9.h, bottom: 13.h),
                // ),
                30.verticalSpace,

                Text(
                  StringConsts.instance.cricketInfo,
                  style: FontPalette.primary18Bold,
                ),
                7.verticalSpace,

                ///Todo: Not available
                /* ProfileTextField(
                  labelText: StringConsts.instance.club,
                  textController: clubCtrl,
                ),*/
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(165, 179, 88, 88),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        ProfileTextField(
                          labelText: StringConsts.instance.battingStyle,
                          textController: battingStyleCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText: StringConsts.instance.bowlingStyle,
                          textController: bowlingStyleCtrl,
                        ),
                        const Divider(
                          color: Color.fromARGB(165, 179, 88, 88),
                        ),
                        ProfileTextField(
                          labelText: StringConsts.instance.fieldingPosition,
                          textController: fieldingPositionCtrl,
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    addressCtrl = TextEditingController();
    emergencyContactNameCtrl = TextEditingController();
    emergencyContactNumberCtrl = TextEditingController();
    clubCtrl = TextEditingController(text: 'Junior (under 18)');
    battingStyleCtrl = TextEditingController(text: 'Right hand');
    bowlingStyleCtrl = TextEditingController(text: 'Spin');
    fieldingPositionCtrl = TextEditingController(text: 'Wicketkeeper');
    myProfileViewModel = context.read<MyProfileViewModel>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      myProfileViewModel.getMyProfile().then((value) {
        emailCtrl.text = value?.memberProfile?.email ?? '';
        phoneCtrl.text = value?.memberProfile?.phoneNumber ?? '';
        addressCtrl.text = value?.memberProfile?.address ?? 'Not updated';
        emergencyContactNameCtrl.text =
            value?.memberProfile?.emergencyContactName ?? '';
        emergencyContactNumberCtrl.text =
            value?.memberProfile?.emergencyContactNumber ?? '';
        battingStyleCtrl.text =
            value?.memberProfile?.battingAnswer?.answerValue ?? '';
        bowlingStyleCtrl.text =
            value?.memberProfile?.bowlingAnswer?.answerValue ?? '';
        fieldingPositionCtrl.text =
            value?.memberProfile?.fieldingAnswer?.answerValue ?? '';
      });
    });
    super.initState();
  }
}
