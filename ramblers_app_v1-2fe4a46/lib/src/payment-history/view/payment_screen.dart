import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/res/widgets/app_text_field.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/utils/routes/app_route.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../res/style/font_palette.dart';
import '../../club_executive/view/club_executive_screen.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ColorPalette.bgColor,
        appBar: CustomAppBar(
          buildContext: context,
          pageTitle: "Payment",
        ),
        body: Column(
          children: [
            SizedBox(
              height: 45.h,
              child: TabBar(
                indicatorWeight: 5,
                automaticIndicatorColorAdjustment: false,
                // isScrollable: true,
                // indicatorPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.fill,
                dividerColor: ColorPalette.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                labelPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(
                    text: 'Pending payment',
                  ),
                  Tab(
                    text: 'Payment history',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PaymentTab1Screen(),

                  PaymentTab2Screen(),
                  // Executies(index: 10),
                  // Executies(index: 3),
                ],
              ),
            ),
          ],
        ),
        // ListView(
        //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        //   children: [
        //     AppTextField(
        //       label: "",
        //       hint: "Last month",
        //       suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
        //           color: Colors.black),
        //       readOnly: true,
        //       controller: TextEditingController(),
        //       onTap: () {},
        //     ),
        //     15.hBox,
        //     Container(
        //       width: 384.w,
        //       decoration: _decoration(),
        //       child: ListView.builder(
        //         itemCount: events.length,
        //         shrinkWrap: true,
        //         itemBuilder: (context, index) {
        //           return EventTile(
        //             event: events[index],
        //           );
        //         },
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

class PaymentTab2Screen extends StatelessWidget {
  const PaymentTab2Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      children: [
        AppTextField(
          label: "",
          hint: "Last month",
          suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
              color: Colors.black),
          readOnly: true,
          controller: TextEditingController(),
          onTap: () {},
        ),
        15.hBox,
        const PaymnetHistoryScreenContainer(),
        20.verticalSpace,
        const PaymnetHistoryScreenContainer(),
        20.verticalSpace,
        const PaymnetHistoryScreenContainer(), 20.verticalSpace,
        const PaymnetHistoryScreenContainer(), 20.verticalSpace,
        const PaymnetHistoryScreenContainer(), 20.verticalSpace,
        const PaymnetHistoryScreenContainer(), 20.verticalSpace,
        const PaymnetHistoryScreenContainer(), 20.verticalSpace,

        // Container(
        //   width: 384.w,
        //   decoration: _decoration(),
        //   child: ListView.builder(
        //     itemCount: events.length,
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return EventTile(
        //         event: events[index],
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}

class PaymnetHistoryScreenContainer extends StatelessWidget {
  const PaymnetHistoryScreenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromARGB(165, 179, 88, 88),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual member fee',
                  style: FontPalette.black16Bold,
                ),
                Text(
                  '\$450',
                  style: FontPalette.black16Bold,
                ),
              ],
            ),
            5.verticalSpace,
            Text(
              'Due date : 10/0/2024',
              style: FontPalette.black14,
            ),
            5.verticalSpace,
            Text(
              'Payment date : 10/0/2024',
              style: FontPalette.black14,
            ),
            5.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class PaymentTab1Screen extends StatelessWidget {
  const PaymentTab1Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
            const PendingPaymentTab(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class PendingPaymentTab extends StatelessWidget {
  const PendingPaymentTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromARGB(165, 179, 88, 88),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual member fee',
                  style: FontPalette.black16Bold,
                ),
                Text(
                  '\$450',
                  style: FontPalette.black16Bold,
                ),
              ],
            ),
            5.verticalSpace,
            Text(
              'Paid amount & date : \$200 , 10/0/2024',
              style: FontPalette.black14,
            ),
            5.verticalSpace,
            Text(
              'Balance amount : \$200',
              style: FontPalette.black14,
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due date : 15/10/2024',
                  style: FontPalette.black14,
                ),
                GestureDetector(
                  onTap: () {
                    showPaymentDailoge(context);
                  },
                  child: Container(
                    color: ColorPalette.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Pay now',
                        style: FontPalette.white15Bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.title.toString(), style: FontPalette.black16Bold),
              Text(event.date.toString(),
                  style: FontPalette.black16Normal.copyWith(
                      color: const Color(0xff111111).withOpacity(0.6))),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText('\$${event.price}', style: FontPalette.black16Bold),
                  AppText(
                    event.status,
                    style: FontPalette.fFCED9E_14Normal.copyWith(
                      color: event.status == "Pending"
                          ? const Color(0xffFC700A)
                          : const Color(0xff49B46D),
                    ),
                  ),
                ],
              ),
              if (event.status == "Pending")
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorPalette.primaryColor,
                )
              else ...[25.wBox]
            ],
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String date;
  final double price;
  final String status;

  Event({
    required this.title,
    required this.date,
    required this.price,
    required this.status,
  });
}

List<Event> events = [
  Event(
    title: '20 20 | Premier-Gold',
    date: 'Aug 07 WED , 2023 | 11:00 am',
    price: 30.0,
    status: 'Pending',
  ),
  Event(
    title: 'T 20 | Senior Team',
    date: 'Aug 08 Mon, 2023 | 10:00 am',
    price: 10.0,
    status: 'Completed',
  ),
  Event(
    title: 'T 20 | Senior Team',
    date: 'Aug 08 Mon, 2023 | 10:00 am',
    price: 10.0,
    status: 'Completed',
  ),
  Event(
    title: 'T 20 | Senior Team',
    date: 'Aug 08 Mon, 2023 | 10:00 am',
    price: 10.0,
    status: 'Completed',
  ),
];

Future<void> showPaymentDailoge(context) async {
  Get.dialog(Dialog(
    backgroundColor: ColorPalette.bgColor,
    shape: const ContinuousRectangleBorder(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   imageSuccess,
          //   scale: 4,
          // ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payment',
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  AppRoutes.popScreen(context);
                },
                child: const Text(
                  'X',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          const Text(
            'Match fee',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Mississauga Ramblers U16 VS ActionZone U16',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          ),
          const Text(
            'Payment amount \$30',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          ),
          10.verticalSpace,
          const Text(
            'Payment amount',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
          ),
          10.verticalSpace,
          TextFormField(
            // keyboardType: type,
            // textInputAction: action,
            // controller: controller,
            cursorHeight: 20,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              hintText: 'Amount',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 6, 6, 6),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black26,
                  width: 1.0,
                ),
              ),
            ),
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return hinText;
            //   }
            //   return null;
            // },
          ),
          30.verticalSpace,
          const Text(
            'Payment method',
            style: TextStyle(fontSize: 18),
          ),
          10.verticalSpace,
          GestureDetector(
            onTap: () {
              AppRoutes.popScreen(context);
              showPaymentDailogeTwo(context);
            },
            child: const PaymentMethodContainers(
              title: 'Credit card',
            ),
          ),
          10.verticalSpace,
          const PaymentMethodContainers(
            title: 'Apple Pay',
          ),
          const Expanded(child: SizedBox())
          // const Text(
          //     text: 'Account has been created successfully',
          //     size: 18,
          //     weight: FontWeight.bold,
          //     color: kWhite),
        ],
      ),
    ),
  ));
}

class PaymentMethodContainers extends StatelessWidget {
  const PaymentMethodContainers({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: ColorPalette.primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(
              Icons.arrow_forward,
              color: ColorPalette.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showPaymentDailogeTwo(context) async {
  Get.dialog(Dialog(
    backgroundColor: ColorPalette.bgColor,
    shape: const ContinuousRectangleBorder(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   imageSuccess,
            //   scale: 4,
            // ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment',
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    AppRoutes.popScreen(context);
                  },
                  child: const Text(
                    'X',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),

            const Text(
              'Payment amount \$30',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            20.verticalSpace,
            const Text(
              'Card information',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            10.verticalSpace,
            CostomeTextFormFieldForPaymentSheet(
              controller: TextEditingController(),
              hinText: 'Card number',
            ),
            Row(
              children: [
                Expanded(
                  child: CostomeTextFormFieldForPaymentSheet(
                    controller: TextEditingController(),
                    hinText: 'MM / YY',
                    left: true,
                  ),
                ),
                Expanded(
                  child: CostomeTextFormFieldForPaymentSheet(
                    controller: TextEditingController(),
                    hinText: 'CVC',
                    right: true,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            const Text(
              'Country or region',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            10.verticalSpace,
            CostomeTextFormFieldForPaymentSheet(
                controller: TextEditingController(), hinText: 'Canada'),
            CostomeTextFormFieldForPaymentSheet(
                controller: TextEditingController(),
                hinText: 'Zip',
                left: true,
                right: true),
            20.verticalSpace,
            const Center(
              child: Text(
                'Save this card for future payments',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            30.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: ColorPalette.primaryColor),
                ),
                Text(
                  ' and ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 111, 111, 111)),
                ),
                Text(
                  'privacy',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: ColorPalette.primaryColor),
                ),
              ],
            ),
            10.verticalSpace,
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRoutes.popScreen(context);
                    showPaymentDailoge(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.primaryColor,
                        strokeAlign: 0.5,
                      ),
                    ),
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text('Back',
                          style: TextStyle(
                              fontSize: 18, color: ColorPalette.primaryColor)),
                    ),
                  ),
                ),
                20.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    AppRoutes.popScreen(context);
                  },
                  child: Container(
                    decoration:
                        const BoxDecoration(color: ColorPalette.primaryColor),
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text('Pay \$30',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            40.verticalSpace
            // const Text(
            //     text: 'Account has been created successfully',
            //     size: 18,
            //     weight: FontWeight.bold,
            //     color: kWhite),
          ],
        ),
      ),
    ),
  ));
}

// ignore: must_be_immutable
class CostomeTextFormFieldForPaymentSheet extends StatelessWidget {
  CostomeTextFormFieldForPaymentSheet(
      {super.key,
      required this.controller,
      required this.hinText,
      this.action,
      this.type,
      this.left,
      this.right});
  bool? left;
  bool? right;
  final TextEditingController controller;
  final String hinText;
  TextInputAction? action;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      textInputAction: action,
      controller: controller,
      cursorHeight: 20,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            topRight: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            bottomLeft: left == true || right == false
                ? const Radius.circular(7)
                : const Radius.circular(0),
            bottomRight: left == false || right == true
                ? const Radius.circular(7)
                : const Radius.circular(0),
          ),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            topRight: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            bottomLeft: left == true || right == false
                ? const Radius.circular(7)
                : const Radius.circular(0),
            bottomRight: left == false || right == true
                ? const Radius.circular(7)
                : const Radius.circular(0),
          ),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            topRight: left == true || right == true
                ? const Radius.circular(0)
                : const Radius.circular(7),
            bottomLeft: left == true || right == false
                ? const Radius.circular(7)
                : const Radius.circular(0),
            bottomRight: left == false || right == true
                ? const Radius.circular(7)
                : const Radius.circular(0),
          ),
          borderSide: const BorderSide(
            color: ColorPalette.primaryColor,
            width: 1.0,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return hinText;
        }
        return null;
      },
    );
  }
}
