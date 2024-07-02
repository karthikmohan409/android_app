import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/app_svg.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/shared/models/club_documents/bloc/club_documents_bloc.dart';
import 'package:mississauga/src/club_document/view/pdf_viewer.dart';
import 'package:mississauga/utils/general_utils.dart';
import 'package:mississauga/utils/space_ext.dart';

final ClubDocumentsBloc documentsBloc = ClubDocumentsBloc();

class ClubDocumentsScreen extends StatelessWidget {
  const ClubDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    documentsBloc.add(ClubDocumentsInitialEvent());
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: "Club documents",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
          children: [
            BlocConsumer<ClubDocumentsBloc, ClubDocumentsState>(
              bloc: documentsBloc,
              listenWhen: (previous, current) =>
                  current is ClubDocumentsActionState,
              buildWhen: (previous, current) =>
                  current is! ClubDocumentsActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case const (ClubDocumentsSuccessfulStete):
                    final successState = state as ClubDocumentsSuccessfulStete;
                    // ignore: unrelated_type_equality_checks
                    if (successState.documentData == true) {
                      return const Center(
                        child: Text(
                          "Empty",
                        ),
                      );
                    }
                    final byLawDocuments = successState.documentData.result;
                    return ListView.builder(
                      itemCount: byLawDocuments!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final firstDoc = byLawDocuments[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(firstDoc.clubDocTypeName,
                                style: FontPalette.black22Normal),
                            10.hBox,
                            divider(),
                            15.hBox,
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 13,
                                childAspectRatio: (2 / 1),
                              ),
                              itemCount: firstDoc.documents!.length,
                              itemBuilder: (context, index) {
                                final doc = firstDoc.documents![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return NetworkPdfViewer(
                                          pdfUrl: doc.clubDocPathUrl!,
                                          title: doc.clubDocName!,
                                        );
                                      },
                                    ));
                                  },
                                  child: Card(
                                    elevation: 10,
                                    margin: EdgeInsets.zero,
                                    child: Container(
                                      height: 80.h,
                                      width: 186.w,
                                      decoration: _decoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const AppSvg(
                                              assetName: Assets.clubDocsIcon),
                                          AppText(
                                            doc.clubDocName,
                                            style: FontPalette.black18Normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )

                            // GridView.count(
                            //   shrinkWrap: true,
                            //   crossAxisCount: 2,
                            //   crossAxisSpacing: 16,
                            //   mainAxisSpacing: 13,
                            //   physics: const ClampingScrollPhysics(),
                            //   childAspectRatio: (2 / 1),
                            //   children: List.generate(6, (index) {
                            //     return Card(
                            //       elevation: 10,
                            //       margin: EdgeInsets.zero,
                            //       child: Container(
                            //         height: 80.h,
                            //         width: 186.w,
                            //         decoration: _decoration(),
                            //         child: Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             AppSvg(assetName: Assets.clubDocsIcon),
                            //             AppText(
                            //               "Document $index",
                            //               style: FontPalette.black18Normal,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   }),
                            // );
                          ],
                        );
                      },
                      // Column(
                      //   children: [
                      //     AppText("Grievance policy",
                      //         style: FontPalette.black22Normal),
                      //     10.hBox,
                      //     divider(),
                      //     15.hBox,
                      //     GridView.count(
                      //       shrinkWrap: true,
                      //       crossAxisCount: 2,
                      //       crossAxisSpacing: 16,
                      //       mainAxisSpacing: 13,
                      //       physics: const ClampingScrollPhysics(),
                      //       childAspectRatio: (2 / 1),
                      //       children: List.generate(4, (index) {
                      //         return Card(
                      //           elevation: 10,
                      //           margin: EdgeInsets.zero,
                      //           child: Container(
                      //             height: 80.h,
                      //             width: 186.w,
                      //             decoration: _decoration(),
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.min,
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.center,
                      //               children: [
                      //                 AppSvg(assetName: Assets.clubDocsIcon),
                      //                 AppText(
                      //                   "Document $index",
                      //                   style: FontPalette.black18Normal,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      //     ),
                      //   ],
                      // )
                    );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            20.hBox,
          ],
        ),
      ),
    );
  }
}

BoxDecoration _decoration() {
  return BoxDecoration(
    color: ColorPalette.bgColor,
    border: Border.all(color: ColorPalette.primaryColor, width: 0.5),
    borderRadius: BorderRadius.circular(8.r),
  );
}
