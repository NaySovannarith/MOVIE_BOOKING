import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("select_language".tr()), // ✅ translated title
        backgroundColor: const Color.fromARGB(255, 239, 8, 8),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.language),
              label: Text("english".tr()),
              onPressed: () {
                context.setLocale(const Locale('en', 'US'));
                EasyLocalization.of(
                  context,
                )?.setLocale(const Locale('en', 'US'));
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.language),
              label: Text("khmer".tr()),
              onPressed: () {
                context.setLocale(const Locale('km', 'KH'));
                EasyLocalization.of(
                  context,
                )?.setLocale(const Locale('km', 'KH'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
