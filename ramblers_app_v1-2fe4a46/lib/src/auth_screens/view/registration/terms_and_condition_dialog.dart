import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class TermsAndConditionDialog extends Dialog{
  const TermsAndConditionDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PdfViewer.openAsset(Assets.filesPrivacyPolicy),
        Positioned(
            right: 5.w,
            top: 5.h,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.close)))
      ],
    );
  }
}
