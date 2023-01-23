import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/Items.dart';

class DashboardItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final IconData icon;
  final int number;
  double mHeight;
  double mWidth;

  DashboardItem({
    required this.id,
    required this.title,
    this.color = Colors.blue,
    required this.icon,
    required this.mHeight,
    required this.mWidth,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final isLANDSCAPE =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      child: mWidth > 480
          ? isPortrait
              //==============================For tablet, portrait==============================
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.00),
                    color: color,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: mHeight * 0.01, horizontal: mWidth * 0.03),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mWidth * 0.04,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                number.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mWidth * 0.05,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                icon,
                                color: Color.fromARGB(86, 255, 255, 255),
                                size: mWidth * 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              //This is for landscape in tablet
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: mHeight * 0.015, horizontal: mWidth * 0.007),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.00),
                    color: color,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: mHeight * 0.01, horizontal: mWidth * 0.03),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mWidth * 0.025,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                number.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mWidth * 0.03,
                                ),
                              ),
                            ),
                            Container(
                              transform: Matrix4.translationValues(
                                  -mWidth * 0.0175, mHeight * 0.02, 0.0),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                icon,
                                color: Color.fromARGB(86, 255, 255, 255),
                                size: mWidth * 0.06,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
          //For mobile
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.00),
                color: color,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: mHeight * 0.01, horizontal: mWidth * 0.05),
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  textBaseline: TextBaseline.ideographic,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mWidth * 0.07,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            number.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mWidth * 0.07,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            icon,
                            color: Color.fromARGB(86, 255, 255, 255),
                            size: mWidth * 0.14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
