import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicetor extends StatelessWidget {
  const PageIndicetor({
    super.key,
    required this.posterPageIndex,
    required this.posterImages,
  });

  final List<String> posterImages;
  final int posterPageIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: posterPageIndex,
      count: posterImages.length,
      effect: const WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        spacing: 8,
        activeDotColor: Color.fromARGB(255, 139, 20, 20),
      ),
    );
  }
}
