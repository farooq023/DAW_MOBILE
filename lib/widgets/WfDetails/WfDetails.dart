import 'package:flutter/material.dart';
import './WfDetailsMobile.dart';
import './WfDetailsPortrait.dart';
import './WfDetailsLandscape.dart';

class WfDetails extends StatelessWidget {
  // const WfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    var mWidth = mSize.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return mWidth > 480
        ? isPortrait
            ? WfDetailsPortrait()
            : WfDetailsLandscape()
        : WfDetailsMobile();
  }
}
