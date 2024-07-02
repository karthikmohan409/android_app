import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/src/home/view/cubit/home_cubit.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsListView extends StatelessWidget {
  SponsorsListView({super.key});

  static const List<String> sponsors = [
    Assets.imagesForexFundsSponsor,
    Assets.imagesLazeezRedWhite,
    Assets.imagesWinLogo,
    Assets.imagesArsakSportsSponsor,
    Assets.imagesWflLogo,
    Assets.imagesTheCoreOptimum,
    Assets.imagesProxmaxFitnessSponsor,
    Assets.imagesIbrarPhotographySponsor,
    Assets.imagesBabasbites,
    Assets.imagesMercedesBramptonSponsor
  ];

  static List<String> sponsorsUrl = [
    'https://myforexfunds.com/',
    'https://www.lazeezshawarma.com/',
    'https://www.winsau.com/',
    'https://arsaksports.com/',
    'https://wheelsforless.ca/',
    'http://thinkcore.ca/',
    'https://www.facebook.com/PromaxFitness/',
    'https://www.instagram.com/ibphca/?hl=en',
    'https://www.babasbites.com/',
    'https://www.mercedes-benz-brampton.ca/staff/pankaj-gupta-sales-consultant-speaks-urdu-hindi-and-punjabi/'
  ];

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: context.sw(size: 0.4),
                child: CarouselSlider.builder(
                  itemCount: sponsors.length,
                  carouselController: controller,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        _launchUrl(sponsorsUrl[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            sponsors[index],
                            fit: BoxFit.contain,
                            height: 156,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 156,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeFactor: 0.3,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.linear,
                    onPageChanged: (index, reason) {
                      cubit.onchngeIndex(index);
                    },
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              AnimatedSmoothIndicator(
                activeIndex: cubit.myCurrentIndex,
                count: sponsors.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 10,
                  dotColor: const Color(0xffC3282E).withOpacity(0.5),
                  activeDotColor: const Color(0xffC3282E),
                  paintStyle: PaintingStyle.fill,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// class SponsorsListView extends StatelessWidget {
//   const SponsorsListView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> sponsors = [
//       Assets.imagesForexFundsSponsor,
//       Assets.imagesLazeezRedWhite,
//       Assets.imagesWinLogo,
//       Assets.imagesArsakSportsSponsor,
//       Assets.imagesWflLogo,
//       Assets.imagesTheCoreOptimum,
//       Assets.imagesProxmaxFitnessSponsor,
//       Assets.imagesIbrarPhotographySponsor,
//       Assets.imagesBabasbites,
//       Assets.imagesMercedesBramptonSponsor
//     ];

//     List<String> sponsorsUrl = [
//       'https://myforexfunds.com/',
//       'https://www.lazeezshawarma.com/',
//       'https://www.winsau.com/',
//       'https://arsaksports.com/',
//       'https://wheelsforless.ca/',
//       'http://thinkcore.ca/',
//       'https://www.facebook.com/PromaxFitness/',
//       'https://www.instagram.com/ibphca/?hl=en',
//       'https://www.babasbites.com/',
//       'https://www.mercedes-benz-brampton.ca/staff/pankaj-gupta-sales-consultant-speaks-urdu-hindi-and-punjabi/'
//     ];
//     return SizedBox(
//       height: context.sw(size: 0.2),
//       child: ListView.separated(
//         itemCount: sponsors.length,
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 22.w),
//         shrinkWrap: true,
//         separatorBuilder: (BuildContext context, int index) => SizedBox(width: 11.w),
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//             onTap: () {
//               _launchUrl(sponsorsUrl[index]);
//             },
//             child: Container(
//               width: context.sw(size: 0.334),
//               padding: EdgeInsets.all(10.r),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5.r))),
//               child: Image.asset(
//                 sponsors[index],
//                 fit: BoxFit.contain,
//               ),
//             ),
//           );
//         },
//       ),
//     ).convertToSliver;
//   }
// }

Future<void> _launchUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
