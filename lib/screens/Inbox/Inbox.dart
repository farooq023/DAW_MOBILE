import 'package:flutter/material.dart';
import './InboxMobile.dart';
import './InboxLandscape.dart';
import './InboxPortrait.dart';

class Inbox extends StatelessWidget {
  static const routeName = '/inbox2';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mWidth = size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return mWidth > 480
        ? isPortrait
            ? InboxPortrait()
            : InboxLandscape()
        : InboxMobile();
  }
}
