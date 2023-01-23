import 'package:flutter/material.dart';
import './SentMobile.dart';
import './SentLandscape.dart';
import 'SentPortrait.dart';

class MySent extends StatefulWidget {
  static const routeName = '/sent';
  @override
  State<MySent> createState() => _MySentState();
}

class _MySentState extends State<MySent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mWidth = size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return mWidth > 480
        ? isPortrait
            ? SentPort()
            : SentLandscape()
        : SentMobile();
  }
}
