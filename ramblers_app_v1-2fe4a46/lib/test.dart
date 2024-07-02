import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          600.verticalSpace,
          ColoredBox(
              color: Colors.red,
              child: TextField(
                scrollPadding: EdgeInsets.only(bottom:40),
              )),
          600.verticalSpace,
        ],
      ),
    );
  }
}
