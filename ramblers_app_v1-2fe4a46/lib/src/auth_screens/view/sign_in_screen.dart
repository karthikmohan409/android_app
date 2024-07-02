import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/locator.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_elevated_btn.dart';
import 'package:mississauga/res/widgets/custom_page_with_out_app_bar.dart';
import 'package:mississauga/res/widgets/custom_text_field.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/src/auth_screens/view_model/sigin_in_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/input_validation_mixin.dart';
import 'package:mississauga/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:mississauga/utils/flavor_config.dart'; // Import FlavorConfig

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with InputValidationMixin {
  late final SignInViewModel signInViewModel;
  late final TextEditingController phoneNumberCtrl;
  late final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: signInViewModel,
      child: Scaffold(
        backgroundColor: flavorConfig.backgroundColor, // Use background color from FlavorConfig
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: CustomPageWithOutAppBar(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          143.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                flavorConfig.logoAsset, // Use logo from FlavorConfig
                                height: 162.h,
                                width: 196.w,
                              ),
                            ],
                          ),
                          60.verticalSpace,
                          Text(
                            StringConsts.instance.logIn,
                            style: FontPalette.black38Regular,
                          ),
                          59.verticalSpace,
                          CustomTextField(
                              textController: phoneNumberCtrl,
                              hintText: StringConsts.instance.phoneNumber,
                              hintStyle: FontPalette.black22RegularShade50
                                  .copyWith(height: .8),
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: 28.w, maxHeight: 30.h),
                              contentPadding: EdgeInsets.only(right: 5.w),
                              valueValidator: (val) => validateMobile(val),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Assets.imagesSmartphone,
                                    height: 30.h,
                                    width: 23.w,
                                  ),
                                ],
                              ),
                              keyboardType: TextInputType.number),
                          32.verticalSpace,
                          Selector<SignInViewModel, LoadState>(
                            selector: (context, provider) => provider.loadState,
                            builder: (context, value, child) {
                              return CustomElevatedBtn(
                                enableLoader: value.isLoading,
                                title: StringConsts.instance.continueText
                                    .toUpperCase(),
                                onTap: () async {
                                  if (formGlobalKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    String? res = await signInViewModel
                                        .sendSigInOtp(phoneNumberCtrl.text);
                                    if (mounted) {
                                      Navigator.pushNamed(
                                          context, RoutesName.verifyOtpScreen,
                                          arguments: res);
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              (context.isKeyboardOpen
                  ? const SizedBox.shrink()
                  : Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 35.h, bottom: 45.h),
                child: Row(
                  children: [
                    16.horizontalSpace,
                    Expanded(
                      child: Text(
                        StringConsts.instance.dontHaveAnAccount,
                        style: FontPalette.black22Regular,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.registrationScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: Text(
                          StringConsts.instance.register,
                          style: FontPalette.primary22Bold,
                        ),
                      ),
                    )
                  ],
                ),
              ))
                  .animatedSwitch()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    signInViewModel = SignInViewModel(authRepo: locator<AuthRepo>.call());
    phoneNumberCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    signInViewModel.dispose();
    super.dispose();
  }
}
