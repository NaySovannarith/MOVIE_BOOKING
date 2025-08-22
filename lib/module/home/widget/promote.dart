import 'package:flutter/material.dart';
import 'package:movie_booking/module/components/promote_card.dart';

SizedBox Promote() {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        PromoteCard(img: "assets/movies/dune2.jpg",
        ),
        PromoteCard(img: "assets/movies/across.jpg"),
        PromoteCard(img: "assets/movies/into.png"),
        PromoteCard(img: "assets/movies/dune.jpg"),
        PromoteCard(img: "assets/movies/shangchi.jpg"),
        PromoteCard(img: "assets/movies/eternals.jpg"),
        PromoteCard(img: "assets/movies/venom.png"),
      ],
    ),
  );
}
