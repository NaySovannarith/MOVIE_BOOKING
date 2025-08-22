 import 'package:flutter/material.dart';

BoxDecoration RatingColor() {
    return BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 124, 21, 31),
                          Color(0xFF6A040F),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    );
  }