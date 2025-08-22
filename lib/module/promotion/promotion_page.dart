import 'package:flutter/material.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotions'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'No promotions available at the moment.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
    );
  }
}
