import 'package:movie_booking/data/model/hall.dart';
import 'package:movie_booking/data/model/schedule.dart';
import 'package:movie_booking/data/model/theater.dart';

class ScheduleListViewModel {
  List<Schedule> scheduleList = [];
  List<Hall> hallList = [
    Hall(id: 1, name: "Hall 1", seats: "100"),
    Hall(id: 2, name: "Hall 2", seats: "150"),
    Hall(id: 3, name: "Hall 3", seats: "200"),
  ];
  List<Theater> theaterList = [
    Theater(id: 1, name: "Demo 1", address: "PP", coverImageUrl: ""),
    Theater(id: 2, name: "Demo 2", address: "PP", coverImageUrl: ""),
    Theater(id: 3, name: "Demo 3", address: "PP", coverImageUrl: ""),
  ];

  void fetchSchedules() {
    // Simulate fetching schedules from a database or API
    initializeSchedules();
  }

  void initializeSchedules() {
    // Example data
    scheduleList = [
      Schedule(
        id: 1,
        time: "14:00",
        date: "2023-11-03",
        hall: hallList[0],
        theater: theaterList[0],
      ),
      Schedule(
        id: 2,
        time: "16:30",
        date: "2023-11-03",
        hall: hallList[1],
        theater: theaterList[0],
      ),
      Schedule(
        id: 3,
        time: "19:00",
        date: "2023-11-03",
        hall: hallList[2],
        theater: theaterList[0],
      ),
    ];
  }
}
