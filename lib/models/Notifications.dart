import 'package:flutter/material.dart';

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;
  double mHeight;
  double mWidth;

  NamedIcon({
    required this.iconData,
    required this.text,
    required this.notificationCount,
    required this.onTap,
    required this.mHeight,
    required this.mWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isLANDSCAPE =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      onTap: onTap,
      //===============================for tablet, portrait mode===============================
      child: mWidth > 480
          ? isPortrait
              ? Container(
                  width: mWidth * 0.145,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(iconData, size: mWidth * 0.05),
                          Text(text,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: mWidth * 0.025))
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: mWidth * 0.03,
                        child: Container(
                          padding: EdgeInsets.all(mWidth * 0.01),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          alignment: Alignment.center,
                          child: FittedBox(child: Text('$notificationCount')),
                        ),
                      )
                    ],
                  ),
                )
              //===============================for tablet, Landscape mode===============================
              : Container(
                  width: mWidth * 0.14,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(iconData, size: mWidth * 0.04),
                          Text(text,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: mWidth * 0.0175))
                        ],
                      ),
                      Positioned(
                        top: -mHeight * 0.005,
                        right: mWidth * 0.04,
                        child: Container(
                          padding: EdgeInsets.all(mWidth * 0.01),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          alignment: Alignment.center,
                          child: FittedBox(child: Text('$notificationCount')),
                        ),
                      )
                    ],
                  ),
                )
          //For mobiles
          : Container(
              width: mWidth * 0.2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(iconData, size: mWidth * 0.06),
                      Text(text, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: mWidth * 0.012,
                    child: Container(
                      width: mWidth * 0.12,
                      padding: EdgeInsets.all(mWidth * 0.001),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: FittedBox(child: Text('$notificationCount')),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
