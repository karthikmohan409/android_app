import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/locator.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_elevated_btn.dart';
import 'package:mississauga/res/widgets/custom_page_with_out_app_bar.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/src/auth_screens/view_model/sigin_in_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/hex_color.dart';
import 'package:mississauga/utils/input_validation_mixin.dart';
import 'package:mississauga/utils/routes/routes_name.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? otp;
  const VerifyOtpScreen({Key? key, this.otp}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen>
    with InputValidationMixin {
  late final TextEditingController _inputController;
  late ValueNotifier<int> currentMicroSeconds;
  late final SignInViewModel signInViewModel;

  PinTheme defaultTheme(double width) => PinTheme(
        width: width,
        height: width,
        textStyle: FontPalette.black22Regular,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: HexColor('#DBDBDB'))),
        ),
      );

  void onResendTap() {}

  Future<void> onComplete(String otp) async {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: signInViewModel,
      child: Scaffold(
        backgroundColor: ColorPalette.bgColor,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: CustomPageWithOutAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConsts.instance.otpVerification,
                  style: FontPalette.black38Bold,
                ),
                4.verticalSpace,
                Text(
                  StringConsts.instance.otpVerificationDesc,
                  style: FontPalette.black22Regular,
                ),
                59.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: LayoutBuilder(builder: (context, constraints) {
                        double width = 300.w < (constraints.maxWidth - 40.w)
                            ? 300.w / 4
                            : ((constraints.maxWidth - 40.w) / 4);
                        return Pinput(
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          controller: _inputController,
                          autofocus: true,
                          defaultPinTheme: defaultTheme(width),
                          focusedPinTheme: defaultTheme(width)
                              .copyDecorationWith(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: HexColor('#282C3F')))),
                          errorPinTheme: defaultTheme(width).copyDecorationWith(
                              border: Border(
                                  bottom:
                                      BorderSide(color: HexColor('#E50019')))),
                          submittedPinTheme: defaultTheme(width),
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          forceErrorState: false,
                          onChanged: (val) {},
                          inputFormatters:
                              inputFormatter(InputFormatType.phoneNumber) ?? [],
                          onCompleted: (val) {},
                        );
                      }),
                    ),
                  ],
                ),
                39.verticalSpace,
                Selector<SignInViewModel, LoadState>(
                  selector: (context, provider) => provider.verifyOtpLoadState,
                  builder: (context, value, child) {
                    return CustomElevatedBtn(
                      enableLoader: value.isLoading,
                      title: StringConsts.instance.verify.toUpperCase(),
                      onTap: () async {
                        if (_inputController.text.length == 4) {
                          FocusScope.of(context).unfocus();
                          bool res = await signInViewModel
                              .verifySigInOtp(_inputController.text);
                          if (res && mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, RoutesName.mainScreen, (route) => false);
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
    );
  }

  @override
  void initState() {
    signInViewModel = SignInViewModel(authRepo: locator<AuthRepo>.call());
    _inputController = TextEditingController(text: widget.otp ?? '');
    currentMicroSeconds = ValueNotifier(30 * 1000000);
    super.initState();
  }
}
