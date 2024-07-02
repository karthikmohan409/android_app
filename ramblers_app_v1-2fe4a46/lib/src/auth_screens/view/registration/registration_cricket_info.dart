import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_elevated_btn.dart';
import 'package:mississauga/shared/models/club_registratio_questionnaire.dart';
import 'package:mississauga/shared/view_model/general_view_model.dart';
import 'package:mississauga/src/auth_screens/model/regDropDownAnswerModel.dart';
import 'package:mississauga/src/auth_screens/view/registration/register_drop_down.dart';
import 'package:mississauga/src/auth_screens/view_model/registration_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/input_validation_mixin.dart';
import 'package:provider/provider.dart';

import '../../../../shared/auth/registration.dart';
import 'terms_and_condition_dialog.dart';

class RegistrationCricketInfo extends StatefulWidget {
  const RegistrationCricketInfo({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  State<RegistrationCricketInfo> createState() =>
      _RegistrationCricketInfoState();
}

class _RegistrationCricketInfoState extends State<RegistrationCricketInfo>
    with InputValidationMixin {
  late final ValueNotifier<double> scrollOffset;
  // late final ValueNotifier<String?> clubValue;
  late final ValueNotifier<String?> battingValue;
  late final ValueNotifier<String?> bowlingValue;
  late final ValueNotifier<String?> fieldingValue;
  // late final TextEditingController cirClubIdCtrl;
  late final formGlobalKey = GlobalKey<FormState>();
  late final RegistrationViewModel registrationViewModel;

  Widget termsAndConditions() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const TermsAndConditionDialog();
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(
          StringConsts.instance.termsAndConditions,
          style: FontPalette.primary_22Regular,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 65.h, left: 31.w, right: 31.w),
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* CustomTextField(
                      textController: cirClubIdCtrl,
                      hintText: StringConsts.instance.cricClubId,
                      hintStyle: FontPalette.black22RegularShade50
                          .copyWith(height: .8, fontWeight: FontWeight.w200),
                      valueValidator: (value) => validateText(value),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 28.w, maxHeight: 30.h),
                      contentPadding: EdgeInsets.only(right: 5.w),
                      textInputAction: TextInputAction.next,
                      onChanged: (val) => registrationViewModel
                          .updateRegisterScreenData(clubId: val),
                    ),
                    15.verticalSpace,
                    Selector<GeneralViewModel, ClubListModel?>(
                      selector: (context, provider) => provider.clubListModel,
                      builder: (context, value, child) {
                        List<String>? values = value?.clubLists?.clubList;
                        return RegisterDropDown(
                          optionList: [...?values],
                          offset: scrollOffset,
                          initialString: StringConsts.instance.club,
                          onChanged: (val) {
                            clubValue.value = val;
                            registrationViewModel.updateRegisterScreenData(
                                club: val);
                          },
                        );
                      },
                    ),
                    15.verticalSpace,*/
                    Selector<GeneralViewModel, ClubRegQuestionnaire?>(
                      selector: (context, provider) =>
                          provider.battingQuestionnaire,
                      builder: (context, value, child) {
                        List<String>? values = value?.questionnaireAnswer
                            ?.map((e) => e.answerOption ?? '')
                            .toList();
                        return RegisterDropDown(
                          optionList: [...?values],
                          offset: scrollOffset,
                          initialString: StringConsts.instance.battingStyle,
                          onChanged: (val) {
                            int? index = value?.questionnaireAnswer?.indexWhere(
                                (element) => element.answerOption == val);
                            if (index != null) {
                              battingValue.value = val;
                              QuestionnaireAnswer? answer =
                                  value?.questionnaireAnswer?[index];
                              registrationViewModel.updateRegisterScreenData(
                                  battingDropDown: RegDropDownAnswerModel(
                                      qAId: answer?.qaId ?? -1,
                                      question: 'Bating Style',
                                      type: value?.type ?? '',
                                      clubId: answer?.clubId ?? -1,
                                      qaAnsId: answer?.qaAnsId ?? -1,
                                      answerOption: val ?? ''));
                            }
                          },
                        );
                      },
                    ),
                    15.verticalSpace,
                    Selector<GeneralViewModel, ClubRegQuestionnaire?>(
                      selector: (context, provider) =>
                          provider.bowlingQuestionnaire,
                      builder: (context, value, child) {
                        List<String>? values = value?.questionnaireAnswer
                            ?.map((e) => e.answerOption ?? '')
                            .toList();
                        return RegisterDropDown(
                          optionList: [...?values],
                          offset: scrollOffset,
                          initialString: StringConsts.instance.bowlingStyle,
                          onChanged: (val) {
                            int? index = value?.questionnaireAnswer?.indexWhere(
                                (element) => element.answerOption == val);
                            if (index != null) {
                              bowlingValue.value = val;
                              QuestionnaireAnswer? answer =
                                  value?.questionnaireAnswer?[index];
                              registrationViewModel.updateRegisterScreenData(
                                  bowlingDropDown: RegDropDownAnswerModel(
                                      qAId: answer?.qaId ?? -1,
                                      question: 'Bowling Style',
                                      type: value?.type ?? '',
                                      clubId: answer?.clubId ?? -1,
                                      qaAnsId: answer?.qaAnsId ?? -1,
                                      answerOption: val ?? ''));
                            }
                          },
                        );
                      },
                    ),
                    15.verticalSpace,
                    Selector<GeneralViewModel, ClubRegQuestionnaire?>(
                      selector: (context, provider) =>
                          provider.fieldingQuestionnaire,
                      builder: (context, value, child) {
                        List<String>? values = value?.questionnaireAnswer
                            ?.map((e) => e.answerOption ?? '')
                            .toList();
                        return RegisterDropDown(
                          optionList: [...?values],
                          offset: scrollOffset,
                          initialString: StringConsts.instance.fieldingPosition,
                          onChanged: (val) {
                            int? index = value?.questionnaireAnswer?.indexWhere(
                                (element) => element.answerOption == val);
                            if (index != null) {
                              fieldingValue.value = val;
                              QuestionnaireAnswer? answer =
                                  value?.questionnaireAnswer?[index];
                              registrationViewModel.updateRegisterScreenData(
                                  fieldingDropDown: RegDropDownAnswerModel(
                                      qAId: answer?.qaId ?? -1,
                                      question: 'Fielding Position',
                                      type: value?.type ?? '',
                                      clubId: answer?.clubId ?? -1,
                                      qaAnsId: answer?.qaAnsId ?? -1,
                                      answerOption: val ?? ''));
                            }
                          },
                        );
                      },
                    ),
                    20.verticalSpace,
                    // Selector<GeneralViewModels, List<ClubRegQuestionnaireTwo>?>(
                    //   selector: (context, provider) => provider.questionnaire,
                    //   builder: (context, questionnaire, child) {
                    //     if (questionnaire == null) {
                    //       return Center(child: CircularProgressIndicator());
                    //     }

                    //     return ListView.builder(
                    //       itemCount: questionnaire.length,
                    //       itemBuilder: (context, index) {
                    //         final question = questionnaire[index];
                    //         List<String> values = question.questionnaireAnswer!
                    //             .map((e) => e.answerOption ?? '')
                    //             .toList();

                    //         return Padding(
                    //           padding:
                    //               const EdgeInsets.symmetric(vertical: 15.0),
                    //           child: RegisterDropDown(
                    //             optionList: values,
                    //             offset: scrollOffset,
                    //             initialString: question.question!,
                    //             onChanged: (val) {
                    //               int selectedAnswerIndex =
                    //                   question.questionnaireAnswer!.indexWhere(
                    //                 (element) => element.answerOption == val,
                    //               );
                    //               if (selectedAnswerIndex != -1) {
                    //                 QuestionnaireAnswer selectedAnswer =
                    //                     question.questionnaireAnswer![
                    //                         selectedAnswerIndex];
                    //                 context
                    //                     .read<GeneralViewModels>()
                    //                     .updateRegisterScreenData(
                    //                       dropDownAnswer:
                    //                           RegDropDownAnswerModel(
                    //                         qAId: selectedAnswer.qaId!,
                    //                         question: question.question!,
                    //                         type: question.type!,
                    //                         clubId: selectedAnswer.clubId!,
                    //                         qaAnsId: selectedAnswer.qaAnsId!,
                    //                         answerOption: val!,
                    //                       ),
                    //                     );
                    //               }
                    //             },
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    termsAndConditions()
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 15.h),
          child: Selector<RegistrationViewModel, LoadState>(
            selector: (context, provider) => provider.loadState,
            builder: (context, value, child) {
              return CustomElevatedBtn(
                title: StringConsts.instance.finish,
                enableLoader: value.isLoading,
                onTap: () async {
                  if (formGlobalKey.currentState!.validate()) {
                    if (battingValue.value == null ||
                        bowlingValue.value == null ||
                        fieldingValue.value == null) {
                      StringConsts.instance.emptyStringMsg.showToast;
                      return;
                    }
                    FocusScope.of(context).unfocus();
                    bool res = await registrationViewModel.registerUser();
                    if (res) {
                      if (mounted) Navigator.pop(context);
                    }
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    scrollOffset = ValueNotifier<double>(0.0);
    // clubValue = ValueNotifier(null);
    battingValue = ValueNotifier(null);
    bowlingValue = ValueNotifier(null);
    fieldingValue = ValueNotifier(null);
    // cirClubIdCtrl = TextEditingController();
    registrationViewModel = context.read<RegistrationViewModel>();
    super.initState();
  }
}
