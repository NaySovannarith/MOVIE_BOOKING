import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String img;
  final String title;
  final String date;
  final String rating;

  const MovieCard({
    super.key,
    required this.img,
    required this.title,
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Poster
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 6),

        // Date + Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: const TextStyle(
                color: Color.fromARGB(255, 141, 141, 141),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 103, 6, 6),
                  width: 1,
                ),
                color: const Color.fromARGB(255, 81, 2, 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        // Title
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
