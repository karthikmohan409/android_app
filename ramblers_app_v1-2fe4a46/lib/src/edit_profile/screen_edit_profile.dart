import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mississauga/data/local/shared_preference_helper.dart';
import 'package:mississauga/data/network/services.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/res/widgets/custom_text_field.dart';
import 'package:mississauga/src/my_profile/view_model/my_profile_view_model.dart';
import 'package:mississauga/utils/app_config.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/routes/app_route.dart';
import 'package:provider/provider.dart';

import '../../res/constants/string_consts.dart';
import '../../res/style/font_palette.dart';
import '../auth_screens/view/registration/register_gender_tile.dart';
import '../my_profile/view/my_profile_header.dart';
import '../my_profile/view/profile_textfield.dart';

class ScreenEditProfile extends StatefulWidget {
  ScreenEditProfile({super.key});

  @override
  State<ScreenEditProfile> createState() => _ScreenEditProfileState();
}

class _ScreenEditProfileState extends State<ScreenEditProfile> {
  // late final TextEditingController emailCtrl;
//  ValueNotifier<int> selectedIndex = 1;
  // late final ValueNotifier<int> selectedIndex;

  // late final MyProfileViewModel myProfileViewModel;
  TextEditingController emailController = TextEditingController(text: '');

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _getImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: 'Edit Profile',
      ),
      backgroundColor: ColorPalette.newBg,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Center(
                  child: SizedBox(
                    width: 130,
                    child: Stack(
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: ColorPalette.primaryColor, width: 3),
                            color: const Color.fromARGB(255, 197, 196, 196),
                          ),
                          child: _image == null
                              ? SizedBox()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(
                                      _image!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () => _getImageFromGallery(),
                            child: const CircleAvatar(
                              backgroundColor: ColorPalette.primaryColor,
                              child: Icon(Icons.camera_alt_rounded),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                Text(
                  'Personal information',
                  style: FontPalette.black22Normal,
                ),
                20.verticalSpace,
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.firstName,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.lastName,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                RegisterGenderTileTwo(
                  selectedIndex: 1,
                ),
                ProfileTextFieldTwo(
                    labelText: StringConsts.instance.dateOfBirth,
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(DateTime.now().year),
                      );
                    }),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.email,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.phone,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.emergencyContactName,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.emergencyContactNumber,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                30.verticalSpace,
                Text(
                  'Cricket information',
                  style: FontPalette.black22Normal,
                ),
                20.verticalSpace,
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.club,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.battingStyle,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: StringConsts.instance.fieldingPosition,
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ProfileTextFieldTwo(
                  labelText: 'Select team category',
                  // textController: phoneCtrl,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.primaryColor)),
                      height: 60,
                      width: 150,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: FontPalette.primary30Bold,
                        ),
                      ),
                    ),
                    20.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        uploadImage(_image!, context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorPalette.primaryColor),
                        height: 60,
                        width: 150,
                        child: Center(
                          child: Text(
                            'Save',
                            style: FontPalette.white30Bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> getImageFromGallery() async {
  //   try {
  //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       _image = image;
  //     });
  //   } catch (e) {
  //     print("Error picking image: $e");
  //   }
  // }

  // Future<void> getImageFromGallery() async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     log('message');
  //     File? img = File(pickedFile.path);
  //     img = await _cropImage(imageFile: img);
  //     // final image = img;
  //     setState(
  //       () {
  //         image = img;
  //       },
  //     );
  //   }
  // }
}

Future<void> postProfilePhoto(XFile image) async {
  int? userId =
      AppConfig.instance.userId ?? await SharedPreferenceHelper.getUserId();
  int? memberId =
      AppConfig.instance.memberId ?? await SharedPreferenceHelper.getMemberId();
  var apiUrl = Uri.parse(baseURL + profilePhotoUpdateURL);
  try {
    var request = http.MultipartRequest('POST', apiUrl)
      ..headers.addAll(
        {
          'Content-Type': 'multipart/form-data',
          'Authorization': baseToken,
        },
      );
    request.fields['member_id'] = memberId.toString();
    request.files.add(await http.MultipartFile.fromPath('photo', image.path));
    request.fields['user_id'] = userId.toString();

    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = await http.Response.fromStream(response);
      var link = json.decode(jsonResponse.body)['photo'];
      log(jsonResponse.toString());
      log("Working");
      log(link);
      return link;
    } else {
      // hideLoadingMain();
      log('Failed to upload image. Status code: ${response.toString()}');
    }
  } catch (error) {
    log(
      'Upload Successfull With Image [ERROR]: $error',
    );
  }
}

Future<void> uploadImage(XFile imageFile, context) async {
  int? userId =
      AppConfig.instance.userId ?? await SharedPreferenceHelper.getUserId();
  int? memberId =
      AppConfig.instance.memberId ?? await SharedPreferenceHelper.getMemberId();
  final uri = Uri.parse(baseURL + profilePhotoUpdateURL);
  final request = http.MultipartRequest('POST', uri)
    ..files.add(await http.MultipartFile.fromPath('photo', imageFile.path))
    ..fields['user_id'] = userId.toString()
    ..fields['member_id'] = memberId.toString()
    ..headers.addAll(
        {'Authorization': baseToken, 'Content-Type': 'multipart/form-data'});

  try {
    log(memberId.toString());
    final response = await request.send();

    if (response.statusCode == 200) {
      AppRoutes.popScreen(context);
      final responseBody = await response.stream.bytesToString();
      if (kDebugMode) {
        print('Upload successful: $responseBody');
      }
    } else {
      print('Upload failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}
