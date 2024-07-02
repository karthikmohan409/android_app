import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_elevated_btn.dart';
import 'package:mississauga/res/widgets/custom_text_field.dart';
import 'package:mississauga/shared/auth/registration.dart';
import 'package:mississauga/src/auth_screens/view_model/registration_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/input_validation_mixin.dart';
import 'package:provider/provider.dart';

import 'register_gender_tile.dart';

class RegistrationPersonalInfo extends StatefulWidget {
  final PageController pageController;
  const RegistrationPersonalInfo({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<RegistrationPersonalInfo> createState() =>
      _RegistrationPersonalInfoState();
}

class _RegistrationPersonalInfoState extends State<RegistrationPersonalInfo>
    with InputValidationMixin, AutomaticKeepAliveClientMixin {
  late final TextEditingController firstNameCtrl;
  late final TextEditingController lastNameCtrl;
  late final TextEditingController dateOfBirthCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController phoneNumberCtrl;
  late final TextEditingController emergencyNameCtrl;
  late final TextEditingController emergencyNumberCtrl;
  late final formGlobalKey = GlobalKey<FormState>();
  late final ValueNotifier<int> selectedIndex;
  late final ValueNotifier<DateTime> selectedDate;
  late final RegistrationViewModel registrationViewModel;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<GeneralViewModels>().fetchQuestionnaire();
    // });

    super.build(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 21.h, left: 31.w, right: 31.w),
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    SizedBox.square(
                      dimension: 75.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(Assets.imagesUserPlaceholder),
                      ),
                    ),
                    17.verticalSpace,
                    CustomTextField(
                      textController: firstNameCtrl,
                      hintText: StringConsts.instance.firstName,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      valueValidator: (value) => validateText(value),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      textInputAction: TextInputAction.next,
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(firstName: val),
                    ),
                    15.verticalSpace,
                    CustomTextField(
                      textController: lastNameCtrl,
                      hintText: StringConsts.instance.lastName,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      valueValidator: (value) => validateText(value),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      textInputAction: TextInputAction.next,
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(lastName: val),
                    ),
                    15.verticalSpace,
                    RegisterGenderTile(
                      selectedIndex: selectedIndex,
                    ),
                    CustomTextField(
                      textController: dateOfBirthCtrl,
                      hintText: StringConsts.instance.dateOfBirth,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      valueValidator: (value) =>
                          validateText(dateOfBirthCtrl.text),
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(dob: val),
                      isReadOnly: true,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(DateTime.now().year - 18),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(DateTime.now().year),
                        );

                        if (date != null) {
                          dateOfBirthCtrl.text =
                              '${date.year}-${date.month}-${date.day}';
                          selectedDate.value = date;
                        }
                      },
                    ),
                    15.verticalSpace,
                    CustomTextField(
                      textController: emailCtrl,
                      hintText: StringConsts.instance.email,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      valueValidator: (value) => validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(email: val),
                    ),
                    15.verticalSpace,
                    CustomTextField(
                      textController: phoneNumberCtrl,
                      hintText: StringConsts.instance.phoneNumber,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      valueValidator: (value) => validateMobile(value),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(mobileNumber: val),
                      inputFormatters:
                          inputFormatter(InputFormatType.phoneNumber),
                    ),
                    15.verticalSpace,
                    CustomTextField(
                      textController: emergencyNameCtrl,
                      hintText: StringConsts.instance.emergencyContactName,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      valueValidator: (value) => validateText(value),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(emergencyName: val),
                      textInputAction: TextInputAction.next,
                    ),
                    15.verticalSpace,
                    CustomTextField(
                        textController: emergencyNumberCtrl,
                        hintText: StringConsts.instance.emergencyContactNumber,
                        hintStyle: FontPalette.black22RegularShade50
                            .copyWith(height: .8),
                        prefixIconConstraints:
                            BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                        valueValidator: (value) => validateMobile(value),
                        contentPadding: EdgeInsets.only(right: 5.w),
                        inputFormatters:
                            inputFormatter(InputFormatType.phoneNumber),
                        onChanged: (val) => registrationViewModel
                            .updateRegisterScreenData(emergencyNumber: val),
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 15.h),
          child: CustomElevatedBtn(
            title: StringConsts.instance.next,
            onTap: () {
              if (formGlobalKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                if (selectedIndex.value == -1) {
                  StringConsts.instance.emptyGenderMsg.showToast;
                  return;
                }
                registrationViewModel.updateRegisterScreenData(
                    dob: dateOfBirthCtrl.text, gender: selectedIndex.value);
                widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              }
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    firstNameCtrl = TextEditingController();
    lastNameCtrl = TextEditingController();
    dateOfBirthCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneNumberCtrl = TextEditingController();
    emergencyNameCtrl = TextEditingController();
    emergencyNumberCtrl = TextEditingController();
    selectedIndex = ValueNotifier(-1);
    selectedDate = ValueNotifier(DateTime.now());
    registrationViewModel = context.read<RegistrationViewModel>();
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
