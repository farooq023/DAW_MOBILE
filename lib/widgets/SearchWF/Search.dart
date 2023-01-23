import 'package:flutter/material.dart';
import './SearchMobile.dart';
import './SearchLandscape.dart';
import './SearchPortrait.dart';

class MySearch extends StatefulWidget {
  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
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
            ? SearchPort()
            : SearchLandscape()
        : SearchMobile();
  }
}
