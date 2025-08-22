import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_booking/module/components/color/header.dart';
import 'package:movie_booking/module/other/page/about_us.dart';
import 'package:movie_booking/module/other/page/condition.dart';
import 'package:movie_booking/module/other/page/contact_us.dart';
import 'package:movie_booking/module/other/page/news.dart';
import 'package:movie_booking/module/other/page/privacy.dart';
import 'package:movie_booking/module/other/widget/build_section.dart';
import 'package:movie_booking/module/other/widget/build_icon.dart';
import 'package:movie_booking/module/profile/profile_page.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            decoration: headerdecoration,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.5,
              title: const Text(
                "Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.5),
                child: Container(color: Colors.grey.shade800, height: 0.5),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          // Account Section
          buildSectionTitle("Account"),
          buildListTile(
            icon: Ionicons.person,
            title: "Profile",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          SizedBox(height: 20),
          // Languages
          buildSectionTitle("Languages"),
          buildListTile(icon: Ionicons.earth, title: "English"),
          SizedBox(height: 20),
          buildSectionTitle("What's new?"),
          buildListTile(
            icon: Ionicons.newspaper,
            title: "News & Activity",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const New()),
              );
            },
          ),
          SizedBox(height: 20),

          // Notifications
          buildSectionTitle("Notifications"),
          buildListTile(
            icon: Ionicons.notifications,
            title: "Notifications",
            onTap: () {
              
            },
          ),
          SizedBox(height: 20),
          // About Us
          buildSectionTitle("About us"),
          SizedBox(height: 10),
          buildListTile(icon: Ionicons.person, title: "About us", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
          }),
          SizedBox(height: 10),
          buildListTile(icon: Ionicons.call, title: "Contact us", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUs()),
              );
          }),
          SizedBox(height: 10),
          buildListTile(
            icon: Ionicons.shield_checkmark,
            title: "Privacy Policy",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Privacy()),
              );
            },
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Ionicons.document_text,
            title: "Term & Conditions",
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Condition()),
              );
            },
          ),
          SizedBox(height: 10),
          buildListTile(icon: Ionicons.log_out, title: "Logout"),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.white54,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Ionicons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Ionicons.pricetags), label: "Offers"),
      //     BottomNavigationBarItem(icon: Icon(Ionicons.location), label: "Cinema"),
      //     BottomNavigationBarItem(icon: Icon(Ionicons.fast_food), label: "F&B"),
      //     BottomNavigationBarItem(icon: Icon(Ionicons.apps), label: "More"),
      //   ],
      // ),
    );
  }
}
