// import 'package:flutter/material.dart';

class InboxItems {
  final String id;
  final String title;
  final String subtitle;
  final String user;
  final String reqN;
  bool expanded;

  InboxItems({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.user,
    required this.reqN,
    this.expanded = false,
  });
}
