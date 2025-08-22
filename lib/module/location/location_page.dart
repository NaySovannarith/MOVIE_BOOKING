import 'package:flutter/material.dart';
import 'package:movie_booking/data/location.dart';
import 'package:movie_booking/module/components/color/header.dart';
import 'package:movie_booking/module/components/tab_buttom.dart';
import 'package:movie_booking/module/location/widget/location_card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int selectedTab = 0; // 0 = Legend, 1 = Major, 2 = Prime

  @override
  Widget build(BuildContext context) {
    final locations =
        selectedTab == 0
            ? legend
            : selectedTab == 1
            ? major
            : prime;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(height: 60, decoration: headerdecoration),
          title: const Text(
            'Cinema Locations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Tabs Section (fixed height)
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔍 Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Cinema",
                        hintStyle: TextStyle(color: Colors.grey),
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => selectedTab = 0),
                          child: tabButton(
                            text: "Legend Cinema",
                            isActive: selectedTab == 0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => setState(() => selectedTab = 1),
                          child: tabButton(
                            text: "Major Cineplex",
                            isActive: selectedTab == 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => setState(() => selectedTab = 2),
                          child: tabButton(
                            text: "Prime Cineplex",
                            isActive: selectedTab == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Cinema Cards (scrollable)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final cinema = locations[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Locationcard(
                      img: cinema["img"]!,
                      address: cinema["address"]!,
                      name: cinema["name"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
