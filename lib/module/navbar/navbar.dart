import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_booking/module/home/home_page.dart';
import 'package:movie_booking/module/location/location_page.dart';
import 'package:movie_booking/module/promotion/promotion_page.dart';
import 'package:movie_booking/module/other/other_page.dart';
import 'package:movie_booking/module/tickets/ticket_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  static const IconData localOfferSharp = IconData(
    0xea96,
    fontFamily: 'MaterialIcons',
  );
  static const List<Widget> _page = [
    HomePage(),
    PromotePage(),
    TicketPage(),
    LocationPage(),
    OtherPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              border: Border.all(color: Colors.black, width: 0.3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: BottomAppBar(
                  color: Colors.black.withOpacity(0.5),
                  elevation: 10,
                  child: SizedBox(
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.home, "home".tr(), 0),
                        _buildNavItem(localOfferSharp, tr("promote"), 1),
                        _buildNavItem(Icons.confirmation_num, "ticket".tr(), 2),
                        _buildNavItem(Icons.location_on, "location".tr(), 3),
                        _buildNavItem(Ionicons.apps, "more".tr(), 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.white54,
              shadows:
                  isSelected
                      ? [
                        Shadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 8,
                        ),
                      ]
                      : [],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
