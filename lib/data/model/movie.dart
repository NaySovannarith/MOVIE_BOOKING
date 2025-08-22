class Movie {
  int id;
  String title;
  String description;
  String posterUrl;
  String releaseDate;
  String director;
  List<String> genres;
  String rating;
  double duration; // Duration in minutes
  String? trailerUrl; // Optional trailer URL

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.releaseDate,
    required this.director,
    required this.genres,
    required this.rating,
    this.trailerUrl,
    this.duration = 0.0, // Default duration is 0 if not provided
  });
}
