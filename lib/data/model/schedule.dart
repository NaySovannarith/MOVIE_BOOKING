import 'package:movie_booking/data/model/hall.dart';
import 'package:movie_booking/data/model/movie.dart';
import 'package:movie_booking/data/model/theater.dart';

class Schedule {
  int id;
  String time;
  String date;
  Hall hall;
  Theater theater;

  Schedule({
    required this.id,
    required this.time,
    required this.date,
    required this.hall,
    required this.theater,
  });
}
