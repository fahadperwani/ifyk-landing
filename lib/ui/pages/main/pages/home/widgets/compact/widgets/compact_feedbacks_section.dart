import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifyk_landing/constants/color_palette.dart';
import 'package:ifyk_landing/ui/pages/main/pages/home/providers/reviews_future_provider.dart';
import 'package:ifyk_landing/ui/widgets/custom_text.dart';
import 'package:ifyk_landing/ui/widgets/png_asset.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CompactFeedbacksSection extends ConsumerStatefulWidget {
  const CompactFeedbacksSection({super.key});

  @override
  ConsumerState createState() => _CompactFeedbacksSectionState();
}

class _CompactFeedbacksSectionState extends ConsumerState<CompactFeedbacksSection> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 75, right: 75, top: 60, bottom: 20),
          child: PngAsset(
            'real_stories_real_experiences_compact',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        ref.watch(reviewsFutureProvider).when(
          data: (reviews) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [Colors.transparent.withOpacity(0.05), Colors.white, Colors.white, Colors.transparent.withOpacity(0.05)],
                    stops: const [0,.1,.9,1],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  // tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 170,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: reviews.map((review) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorPalette.feedbackBorderColor),
                            color: ColorPalette.feedbackBgColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              label: review.title,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(review.score, (index){
                                return const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: PngAsset(
                                    'star',
                                    height: 20,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 5),
                            CustomText(
                              label: review.text,
                              fontSize: 13,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          },
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}

