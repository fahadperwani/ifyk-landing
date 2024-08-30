import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ifyk_landing/router/router.gr.dart';
import 'package:ifyk_landing/ui/pages/main/pages/home/widgets/wide/widgets/wide_feedbacks_section.dart';
import 'package:ifyk_landing/ui/pages/main/pages/home/widgets/wide/widgets/wide_footer.dart';
import 'package:ifyk_landing/ui/pages/main/widgets/wide_wrapper.dart';
import 'package:ifyk_landing/ui/utils/size_util.dart';
import 'package:ifyk_landing/ui/widgets/jpg_asset.dart';
import 'package:ifyk_landing/ui/widgets/png_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeWideContent extends StatelessWidget {
  const HomeWideContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1500;
    final screenWidth = SizeUtil.screenWidth(context) < maxWidth ? SizeUtil.screenWidth(context) : maxWidth;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            WideWrapper(
              child: Column(
                children: [
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: screenWidth/20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: screenWidth/7),
                              const PngAsset('all_events_one_place'),
                              // SizedBox(height: screenWidth/100),
                              Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: screenWidth/30),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: screenWidth/30),
                                          Flexible(
                                            child: GestureDetector(
                                              onTap: (){
                                                launchUrl(Uri.parse('https://apps.apple.com/us/app/ifyk/id6468367267'));
                                              },
                                              child: const PngAsset(
                                                'app_store',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth/100),
                                          const Flexible(
                                            child: PngAsset(
                                              'google_play',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth/100),
                                  PngAsset('fire', width: screenWidth/35,),
                                  SizedBox(width: screenWidth/20),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth/30),
                                  Padding(
                                    padding: EdgeInsets.only(top: screenWidth/50),
                                    child: PngAsset('party', width: screenWidth/35,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: PngAsset(
                            'main_images',
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth/8),
                    child: const PngAsset(
                      'going_out_made_easy',
                    ),
                  ),
                  SizedBox(height: screenWidth/20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth/3),
                    child: const PngAsset(
                      'never_miss_out',
                    ),
                  ),
                  SizedBox(height: screenWidth/30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth/30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: PngAsset(
                              'interactive_map_view',
                              height: screenWidth/2,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth/20),
                        Expanded(
                          child: Center(
                            child: PngAsset(
                              'easy_filters',
                              height: screenWidth/2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth/10),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth/8),
                          child: const PngAsset(
                            'swipe_scroll_discover',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth/4, right: screenWidth/4, top: screenWidth/9, bottom: screenWidth/30),
                    child: const PngAsset(
                      'best_things_to_do_in_your_city',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> context.pushRoute(CityRoute(cityId: 'new-york')),
                    child: SizedBox(
                      height: screenWidth/2,
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: JpgAsset(
                              'new_york',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40,),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PngAsset(
                                'new_york_text',
                                height: screenWidth/30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> context.pushRoute(CityRoute(cityId: 'los-angeles')),
                    child: SizedBox(
                      height: screenWidth/2,
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: JpgAsset(
                              'los_angeles',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40,),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PngAsset(
                                'los_angeles_text',
                                height: screenWidth/30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> context.pushRoute(CityRoute(cityId: 'chicago')),
                    child: SizedBox(
                      height: screenWidth/2,
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: JpgAsset(
                              'chicago',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40,),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PngAsset(
                                'chicago_text',
                                height: screenWidth/30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> context.pushRoute(CityRoute(cityId: 'las-vegas')),
                    child: SizedBox(
                      height: screenWidth/2,
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: JpgAsset(
                              'las_vegas',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40,),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PngAsset(
                                'las_vegas_text',
                                height: screenWidth/30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> context.pushRoute(CityRoute(cityId: 'houston')),
                    child: SizedBox(
                      height: screenWidth/2,
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: JpgAsset(
                              'houston',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PngAsset(
                                'houston_text',
                                height: screenWidth/30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const WideFeedbacksSection(),
            const WideWrapper(
              maxWidth: 1200,
              child: WideFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
