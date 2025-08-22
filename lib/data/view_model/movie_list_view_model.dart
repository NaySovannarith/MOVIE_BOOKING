import 'package:movie_booking/data/model/movie.dart';

class MovieListViewModel {
  List<Movie> movieList = [];
  List<Movie> _originalMovieList = [];
  void getNowShowingMovies() {
    final today = DateTime.now();
    movieList =
        _originalMovieList.where((movie) {
          final release = DateTime.tryParse(movie.releaseDate);
          return release != null &&
              release.isBefore(today.add(const Duration(days: 1)));
        }).toList();
  }

  void getComingSoonMovies() {
    final today = DateTime.now();
    movieList =
        _originalMovieList.where((movie) {
          final release = DateTime.tryParse(movie.releaseDate);
          return release != null && release.isAfter(today);
        }).toList();
  }

  void fetchMovies() {
    // Simulate fetching movies from a database or API
    initializeMovies();
    movieList = _originalMovieList;
  }

  void initializeMovies() {
    _originalMovieList = [
      Movie(
        id: 1,
        title: "Dune: Part Two",
        description: "The epic conclusion to the Dune saga.",
        posterUrl:
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR1HYYqIoovqLVr7DQU9tevo_bMrzQqJ7LQiVnjyK1x5BUHqrjFB_JDtftcR1Sxo1cPE0fPmg",
        releaseDate: "2023-11-03",
        director: "Denis Villeneuve",
        genres: ["Sci-Fi", "Adventure"],
        rating: "PG-13",
      ),
      Movie(
        id: 2,
        title: "Avatar 3",
        description: "The next chapter in the Avatar series.",
        posterUrl:
            "https://m.media-amazon.com/images/I/61YSJQMw-LL._UF894,1000_QL80_.jpg",
        releaseDate: "2025-12-19",
        director: "James Cameron",
        genres: ["Sci-Fi", "Fantasy"],
        rating: "PG-13",
      ),
      Movie(
        id: 3,
        title: "Avengers: Secret Wars",
        description: "The Avengers face their greatest challenge yet.",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcHCUUesJZHq-8eW8RUPchzSeKp6y6Bx6xBw&s",
        releaseDate: "2027-05-01",
        director: "Various",
        genres: ["Action", "Adventure"],
        rating: "PG-13",
      ),
      Movie(
        id: 4,
        title: "Beyond the Spider-Verse",
        description: "The next installment in the Spider-Verse saga.",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSfxsL5xozSmDdSnooVRLiNr5QdKPyWXvsSg&s",
        releaseDate: "2027-03-10",
        director: "Various",
        genres: ["Animation", "Action"],
        rating: "PG-13",
      ),
      Movie(
        id: 5,
        title: "The Odyssey",
        description: "A new epic adventure in the world of mythology.",
        posterUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/The_Odyssey_%282026_film%29_poster.jpg/250px-The_Odyssey_%282026_film%29_poster.jpg",
        releaseDate: "2026-07-15",
        director: "Various",
        genres: ["Adventure", "Fantasy"],
        rating: "PG-13",
      ),
      Movie(
        id: 6,
        title: "Dune 1",
        description: "The first part of the Dune saga.",
        posterUrl:
            "https://m.media-amazon.com/images/I/61QbqeCVm0L._UF894,1000_QL80_.jpg",
        releaseDate: "2021-10-22",
        director: "Denis Villeneuve",
        genres: ["Sci-Fi", "Adventure"],
        rating: "R18",
      ),
      Movie(
        id: 7,
        title: "Into the Spider-Verse",
        description: "The animated adventure that started it all.",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLwbsMXeqdOP3aT5XT3FpDprl71ZCBaz3FkA&s",
        releaseDate: "2018-12-14",
        director: "Bob Persichetti, Peter Ramsey, Rodney Rothman",
        genres: ["Animation", "Action"],
        rating: "PG13",
      ),
      Movie(
        id: 8,
        title: "Across the Spider-Verse ",
        description: "The sequel to Into the Spider-Verse .",
        posterUrl:
            "https://www.movieposters.com/cdn/shop/products/spider-man-across-the-spider-verse_gh6f43xr_480x.progressive.jpg?v=1673378601",
        releaseDate: "2023-06-02",
        director: "Joaquim Dos Santos, Kemp Powers, Justin K. Thompson",
        genres: ["Animation", "Action"],
        rating: "PG",
      ),
    ];
  }

  void getMovieSchedule() {}
}
