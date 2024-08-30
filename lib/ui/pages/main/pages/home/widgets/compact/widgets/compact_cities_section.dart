import 'package:flutter/material.dart';
import 'package:ifyk_landing/ui/widgets/jpg_asset.dart';
import 'package:ifyk_landing/ui/widgets/png_asset.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CompactCitiesSection extends StatefulWidget {
  const CompactCitiesSection({super.key});

  @override
  State<CompactCitiesSection> createState() => _CompactCitiesSectionState();
}

class _CompactCitiesSectionState extends State<CompactCitiesSection> {
  final CarouselController _controller = CarouselController();
  final List<String> _cities = [
    'new_york',
    'los_angeles',
    'chicago',
    'las_vegas',
    'houston',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 75, right: 75, top: 60, bottom: 20),
          child: PngAsset(
            'best_things_to_do_in_your_city_compact',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        ShaderMask(
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
              height: 600,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,

            ),
            items: _cities.map((city) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: JpgAsset(
                            '${city}_compact',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: PngAsset(
                              '${city}_text',
                              height: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
