import 'package:flutter/material.dart';

extension NumberExtension on num {
  /// <b>SizedBox with height : SizedBox(height: 8)<b/>
  Widget get hBox => SizedBox(height: toDouble());
  /// <b>SizedBox with width : SizedBox(width: 8)<b/>
  Widget get wBox => SizedBox(width: toDouble());
}
