import 'package:flutter/material.dart';
import 'package:movie_booking/module/components/promote_card.dart';

class PromotePage extends StatelessWidget {
  const PromotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "img": "assets/movies/dune2.jpg",
        "title": "Dune: Part Two",
        "desc": "The epic continuation of the sci-fi saga.",
      },
      {
        "img": "assets/movies/across.jpg",
        "title": "Across the Spider-Verse",
        "desc": "Miles Morales returns with a multiverse adventure.",
      },
      {
        "img": "assets/movies/into.png",
        "title": "Into the Spider-Verse",
        "desc": "The Oscar-winning animated Spider-Man story.",
      },
      {
        "img": "assets/movies/dune.jpg",
        "title": "Dune",
        "desc": "The beginning of Paul Atreides journey.",
      },
      {
        "img": "assets/movies/shangchi.jpg",
        "title": "Shang-Chi",
        "desc": "Marvel’s master of martial arts awakens his power.",
      },
      {
        "img": "assets/movies/eternals.jpg",
        "title": "Eternals",
        "desc": "Immortal beings protect humanity across millennia.",
      },
      {
        "img": "assets/movies/venom.png",
        "title": "Venom",
        "desc": "The symbiote rises with Eddie Brock.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotions"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bigger image card
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(movie["img"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title + description
              Text(
                movie["title"]!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                movie["desc"]!,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
