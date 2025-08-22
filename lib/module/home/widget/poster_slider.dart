import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/module/components/page_indicetor.dart';
import 'package:movie_booking/module/home/widget/poster_card.dart';

final List<String> posterImages = [
  "assets/movies/dune2.jpg",
  "assets/movies/across.jpg",
  "assets/movies/into.png",
  "assets/movies/dune.jpg",
  "assets/movies/shangchi.jpg",
  "assets/movies/eternals.jpg",
  "assets/movies/venom.png",
];

class PosterSlider extends StatefulWidget {
  const PosterSlider({Key? key}) : super(key: key);

  @override
  _PosterSliderState createState() => _PosterSliderState();
}

class _PosterSliderState extends State<PosterSlider> {
  int _posterPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider.builder(
          itemCount: posterImages.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              child: PosterCard(img: posterImages[index]),
            );
          },
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            viewportFraction: 0.9,
            initialPage: 0,
            enlargeFactor: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _posterPageIndex = index;
              });

              print("Page changed to $index $reason");
            },
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: PageIndicetor(
            posterPageIndex: _posterPageIndex,
            posterImages: posterImages,
          ),
        ),
      ],
    );
  }
}
