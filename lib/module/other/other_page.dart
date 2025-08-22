import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_booking/module/components/color/header.dart';
import 'package:movie_booking/module/other/page/about_us.dart';
import 'package:movie_booking/module/other/page/condition.dart';
import 'package:movie_booking/module/other/page/contact_us.dart';
import 'package:movie_booking/module/other/page/language.dart';
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
                "account",
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
          buildSectionTitle("account".tr()),
          buildListTile(
            icon: Ionicons.person,
            title: "profile".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          SizedBox(height: 20),
          // Languages
          buildSectionTitle('languages'.tr()),
          buildListTile(
            icon: Ionicons.earth,
            title: "select_language".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguagePage()),
              );
            },
          ),
          SizedBox(height: 20),
          buildSectionTitle("whats_new".tr()),
          buildListTile(
            icon: Ionicons.newspaper,
            title: 'news'.tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const New()),
              );
            },
          ),
          SizedBox(height: 20),

          // Notifications
          buildSectionTitle("notifications".tr()),
          buildListTile(
            icon: Ionicons.notifications,
            title: "notifications".tr(),
            onTap: () {},
          ),
          SizedBox(height: 20),
          // About Us
          buildSectionTitle("about_us".tr()),
          SizedBox(height: 10),
          buildListTile(
            icon: Ionicons.person,
            title: "about_us".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Ionicons.call,
            title: "contact_us".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUs()),
              );
            },
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Ionicons.shield_checkmark,
            title: "privacy_policy".tr(),
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
            title: "terms_conditions".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Condition()),
              );
            },
          ),
          SizedBox(height: 10),
          buildListTile(icon: Ionicons.log_out, title: "logout".tr()),
        ],
      ),
    );
  }
}
