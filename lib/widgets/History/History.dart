import 'package:flutter/material.dart';
import './HistoryMobile.dart';
import './HistoryLandscape.dart';
import './HistoryProtrait.dart';

class MyHistory extends StatefulWidget {
  static const routeName = '/history';
  @override
  State<MyHistory> createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return mWidth > 480
        ? isPortrait
            ? HistoryProtrait()
            : HistoryLandscape()
        : HistoryMobile();
  }
}
