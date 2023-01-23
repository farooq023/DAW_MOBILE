import 'package:flutter/material.dart';

class Items {
  final String id;
  final String title;
  final Color color;
  final IconData icon;
  final int number;

  Items({
    required this.id,
    required this.title,
    this.color = Colors.blue,
    required this.icon,
    required this.number,
  });
}
