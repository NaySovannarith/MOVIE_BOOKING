import 'package:flutter/material.dart';
import 'package:movie_booking/data/view_model/movie_list_view_model.dart';
import 'package:movie_booking/data/view_model/schedule_list_view_model.dart';
import 'package:movie_booking/module/tickets/widget/ticket_card.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int selectedTab = 0; // 0: Upcoming, 1: History

  final MovieListViewModel movieVM = MovieListViewModel();
  final ScheduleListViewModel scheduleVM = ScheduleListViewModel();

  @override
  void initState() {
    super.initState();
    movieVM.fetchMovies();
    scheduleVM.fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    final tickets =
        scheduleVM.scheduleList.map((schedule) {
          final movie =
              movieVM.movieList.isNotEmpty
                  ? movieVM.movieList[schedule.id % movieVM.movieList.length]
                  : null;
          return {
            "poster": movie?.posterUrl ?? "",
            "title": movie?.title ?? "Unknown",
            "code": "CODE${schedule.id.toString().padLeft(5, '0')}",
            "time": "${schedule.time} | ${schedule.date}",
            "location": schedule.theater.name,
            "claimed": "Claimed",
          };
        }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 19, 20, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,

        // title: const Text(
        //   "Purchase",
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 22,
        //     letterSpacing: 0.5,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70),
          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [_buildTab("Upcoming", 0), _buildTab("History", 1)],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: tickets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return ticket_card(ticket: ticket);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? const Color.fromARGB(255, 40, 40, 40)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  height: 3,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
