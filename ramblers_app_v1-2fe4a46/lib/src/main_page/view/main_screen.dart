import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/src/home/view/home_screen.dart';
import 'package:mississauga/src/main_page/view/events_and_news_screen.dart';
import 'package:mississauga/src/my_profile/view/my_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ValueNotifier<int> selectedIndex;

  final List<Widget> _pages = [
    const HomeScreen(),
    EventsAndNewsScreen(),
    Container(),
    const MyProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, value, _) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorPalette.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorPalette.bgColor,
        selectedLabelStyle: FontPalette.fFCED9E_14Normal,
        unselectedLabelStyle: FontPalette.fFCED9E_14Normal,
        unselectedItemColor: ColorPalette.bgColor,
        useLegacyColorScheme: false,
        onTap: (index) {
          selectedIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesHomeUnselect,
                height: 26.r,
                width: 26.r,
              ),
              label: StringConsts.instance.home),
          BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesEventsUnselect,
                height: 26.r,
                width: 26.r,
              ),
              label: StringConsts.instance.eventsAndNews),
          BottomNavigationBarItem(
              // icon: Icon(
              //   Icons.shopping_cart_outlined,
              //   size: 25,
              // ),
              icon: Image.asset(
                Assets.imagesEcommerseUnselect,
                height: 26.r,
                width: 26.r,
              ),
              label: StringConsts.instance.ecommerce),
          BottomNavigationBarItem(
              // icon : Icons.person
              icon: Image.asset(
                Assets.imagesProfileUnselect,
                height: 26.r,
                width: 26.r,
              ),
              label: StringConsts.instance.profile)
        ],
      ),
    );
  }

  @override
  void initState() {
    selectedIndex = ValueNotifier(0);
    super.initState();
  }
}
