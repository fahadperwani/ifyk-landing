import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifyk_landing/constants/color_palette.dart';
import 'package:ifyk_landing/ui/pages/main/pages/home/widgets/compact/widgets/compact_feedbacks_section.dart';
import 'package:ifyk_landing/ui/pages/main/pages/home/widgets/compact/widgets/compact_footer.dart';
import 'package:ifyk_landing/ui/widgets/png_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCompactContent extends StatefulWidget {
  const HomeCompactContent({super.key});

  @override
  State<HomeCompactContent> createState() => _HomeCompactContentState();
}

class _HomeCompactContentState extends State<HomeCompactContent> {
  List<String> images = [
    'all_events_one_place_compact',
    'party',
    'fire',
    'app_store',
    'google_play',
    'main_images_compact',
    'going_out_made_easy_compact',
    'interactive_map_view_compact',
    'easy_filters_compact',
    'swipe_scroll_discover_compact',
    'star',
    'footer_glow',
    'logo',
  ];



  @override
  void didChangeDependencies() {
    for (var image in images) {
      precacheImage(AssetImage('assets/png/$image.png'), context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: PngAsset(
              'all_events_one_place_compact',
            ),
          ),
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PngAsset(
                      height: 30,
                      'party',
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: PngAsset(
                        height: 30,
                        'fire',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
                child: Row(
                  children: [
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
                    const SizedBox(width: 10),
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
            ],
          ),
          const SizedBox(height: 20),
          const PngAsset(
            'main_images_compact',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 60),
            child: PngAsset(
              'going_out_made_easy_compact',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          Text(
            "NEVER MISS OUT",
            style: GoogleFonts.unbounded(
              fontWeight: FontWeight.w500,
              fontSize: 27,
              color: ColorPalette.primary ,
            ),
          ),
          Text(
            "ON LOCAL EVENTS",
            style: GoogleFonts.unbounded(
              fontWeight: FontWeight.w500,
              fontSize: 27,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: PngAsset(
              'interactive_map_view_compact',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: PngAsset(
              'easy_filters_compact',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 70),
            child: PngAsset(
              'swipe_scroll_discover_compact',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          // const CompactCitiesSection(),
          const CompactFeedbacksSection(),
          const CompactFooter(),
        ],
      ),
    );
  }
}
