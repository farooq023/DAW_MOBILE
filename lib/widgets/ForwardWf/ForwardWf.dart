import 'package:flutter/material.dart';
import './ForwardWfMobile.dart';
import './ForwardWfLandscape.dart';
import './ForwardWfPortrait.dart';

class ForwardWf extends StatelessWidget {
  // const WfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    var mWidth = mSize.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return mWidth > 480
        ? isPortrait
            ? ForwardWfPortrait()
            : ForwardWfLandscape()
        : ForwardWfMobile();
  }
}
