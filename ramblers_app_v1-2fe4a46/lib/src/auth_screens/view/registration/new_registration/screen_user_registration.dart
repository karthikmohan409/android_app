import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/src/auth_screens/view/registration/register_gender_tile.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/input_validation_mixin.dart';
import 'package:provider/provider.dart';
import 'package:mississauga/locator.dart';

import '../../../../../res/constants/global_variables.dart';
import '../../../../../res/style/color_palette.dart';
import '../../../../../res/style/font_palette.dart';
import '../../../../../res/widgets/custom_elevated_btn.dart';
import '../../../../../res/widgets/custom_text_field.dart';
import '../../../repository/auth_repo.dart';
import '../../../view_model/registration_view_model.dart';

class ScreenUserRegistration extends StatefulWidget {
  const ScreenUserRegistration({super.key});

  @override
  State<ScreenUserRegistration> createState() => _ScreenUserRegistrationState();
}

class _ScreenUserRegistrationState extends State<ScreenUserRegistration>
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
  Future<bool> handleBackBtn({bool onTap = false}) async {
    if (onTap) {
      Navigator.of(context).pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      // registrationViewModel =
      //     RegistrationViewModel(authRepo: locator<AuthRepo>.call());
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
    void dispose() {
      registrationViewModel.dispose();
      super.dispose();
    }

    return ChangeNotifierProvider.value(
      value: registrationViewModel,
      child: Scaffold(
          backgroundColor: ColorPalette.bgColor,
          appBar: AppBar(
            backgroundColor: ColorPalette.bgColor,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: IconButton(
                icon: Image.asset(
                  Assets.imagesArrowBack,
                  height: 29.h,
                  width: 29.w,
                ),
                onPressed: () => handleBackBtn(onTap: true),
              ),
            ),
            titleSpacing: 10.w,
            title: Text(
              StringConsts.instance.registration,
              style: FontPalette.black30Bold,
            ),
          ),
          body: WillPopScope(
            onWillPop: handleBackBtn,
            child: Column(
              children: [
                10.verticalSpace,
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 21.h, left: 31.w, right: 31.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            SizedBox.square(
                              dimension: 75.r,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:
                                    Image.asset(Assets.imagesUserPlaceholder),
                              ),
                            ),
                            17.verticalSpace,
                            CustomTextField(
                              textController: firstNameCtrl,
                              hintText: StringConsts.instance.firstName,
                              hintStyle: FontPalette.black22RegularShade50
                                  .copyWith(height: .8),
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
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
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
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
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
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
                                  initialDate:
                                      DateTime(DateTime.now().year - 18),
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
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
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
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
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
                              hintText:
                                  StringConsts.instance.emergencyContactName,
                              hintStyle: FontPalette.black22RegularShade50
                                  .copyWith(height: .8),
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
                              valueValidator: (value) => validateText(value),
                              contentPadding: EdgeInsets.only(right: 5.w),
                              onChanged: (val) => registrationViewModel
                                  .updateRegisterScreenData(emergencyName: val),
                              textInputAction: TextInputAction.next,
                            ),
                            15.verticalSpace,
                            CustomTextField(
                                textController: emergencyNumberCtrl,
                                hintText: StringConsts
                                    .instance.emergencyContactNumber,
                                hintStyle: FontPalette.black22RegularShade50
                                    .copyWith(height: .8),
                                prefixIconConstraints: BoxConstraints(
                                    maxWidth: 28.w, maxHeight: 30.h),
                                valueValidator: (value) =>
                                    validateMobile(value),
                                contentPadding: EdgeInsets.only(right: 5.w),
                                inputFormatters:
                                    inputFormatter(InputFormatType.phoneNumber),
                                onChanged: (val) => registrationViewModel
                                    .updateRegisterScreenData(
                                        emergencyNumber: val),
                                keyboardType: TextInputType.number),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 31.w, vertical: 15.h),
                  child: CustomElevatedBtn(
                    // title: StringConsts.instance.next,
                    title: StringConsts.instance.finish,
                    // enableLoader: value.isLoading,
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        if (selectedIndex.value == -1) {
                          StringConsts.instance.emptyGenderMsg.showToast;
                          return;
                        }
                        FocusScope.of(context).unfocus();
                        bool res = await registrationViewModel.registerUser();
                        if (res) {
                          if (mounted) Navigator.pop(context);
                        }
                        //   registrationViewModel.updateRegisterScreenData(
                        //       dob: dateOfBirthCtrl.text, gender: selectedIndex.value);
                        //   widget.pageController.nextPage(
                        //       duration: const Duration(milliseconds: 300),
                        //       curve: Curves.linear);
                      }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // @override
  // bool get wantKeepAlive => throw UnimplementedError();

  // @override
  // void initState() {
  //   // pageController = PageController(initialPage: 1);
  //   // pageIndex = ValueNotifier(0);
  //   registrationViewModel =
  //       RegistrationViewModel(authRepo: locator<AuthRepo>.call());
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   registrationViewModel.dispose();
  //   super.dispose();
  // }
}
