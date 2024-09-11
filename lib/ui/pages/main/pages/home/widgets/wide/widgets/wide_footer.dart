import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifyk_landing/constants/color_palette.dart';
import 'package:ifyk_landing/router/router.gr.dart';
import 'package:ifyk_landing/ui/utils/size_util.dart';
import 'package:ifyk_landing/ui/widgets/png_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class WideFooter extends StatelessWidget {
  final double topPadding;
  const WideFooter({super.key, this.topPadding = 100});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    const double maxWidth = 1000;
    final screenWidth = SizeUtil.screenWidth(context) < maxWidth ? SizeUtil.screenWidth(context) : maxWidth;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          const Positioned.fill(child: PngAsset('footer_glow')),
          Column(
            children: [
              SizedBox(height: topPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth/3.8),
                child: AutoSizeText(
                  "READY TO EXPLORE?",
                  maxLines: 1,
                  minFontSize: 15,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.unbounded(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: ColorPalette.primary,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth/3.6),
                child: AutoSizeText(
                  "See what’s happening near you. Download the app and start your adventure!",
                  maxLines: 2,
                  minFontSize: 10,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                    color: ColorPalette.white,
                  ),
                ),
              ),
              SizedBox(height: screenWidth/30),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth/3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: (){
                            launchUrl(Uri.parse('https://apps.apple.com/us/app/ifyk/id6468367267'));
                          },
                          child: const PngAsset('app_store'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        child: GestureDetector(
                          onTap: (){
                            launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.ifyk'));
                          },
                          child: const PngAsset('google_play'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth/20),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: screenWidth/15, right: screenWidth/15, top: 40),
                  decoration: const BoxDecoration(
                      color: ColorPalette.footerColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: PngAsset(
                                    'logo',
                                    width: screenWidth/12,
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 2,
                              //   child: Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: PngAsset(
                              //       'subscribe_to_our_newsletter',
                              //       width: screenWidth/4 ,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(right: screenWidth/20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          tabsRouter.setActiveIndex(1);
                                        },
                                        child: Text(
                                          'ABOUT',
                                          style: GoogleFonts.unbounded(
                                              fontSize: 9
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          tabsRouter.setActiveIndex(2);
                                        },
                                        child: Text(
                                          'CONTACT',
                                          style: GoogleFonts.unbounded(
                                              fontSize: 9
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          context.pushRoute(const PrivacyPolicyRoute());
                                        },
                                        child: Text(
                                          'PRIVACY POLICY',
                                          style: GoogleFonts.unbounded(
                                              fontSize: 9
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 50),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     launchUrl(Uri.parse('https://ifykevents.com/terms_condition'));
                                      //   },
                                      //   child: Text(
                                      //     'TERMS & CONDITIONS',
                                      //     style: GoogleFonts.unbounded(
                                      //         fontSize: 9
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  ///TODO: EMAIL INPUT
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // const PngAsset(
                          //   'socials',
                          // ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: .5,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Copyright 2024, ifYK. All Rights Reserved', style: GoogleFonts.unbounded(fontSize: 12)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
