import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  double mHeight;
  double mWidth;

  LoginHeader(this.mHeight, this.mWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      width: mWidth,
      child: Stack(
        children: [
          //this clop path is used to draw the shape of header
          ClipPath(
            //This clipper is used to create the right clipper
            clipper: ShapeClipper([
              Offset(mWidth / 5, mHeight),
              Offset(mWidth * 7 / 20, mHeight - 100),
              Offset(mWidth / 5, mHeight + 10),
              Offset(mWidth * 2, mHeight - 18)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).accentColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
          ClipPath(
            //This clipper is used to create the left clipper
            clipper: ShapeClipper([
              Offset(mWidth / 5, mHeight + 20),
              Offset(mWidth / 10 * 8, mHeight - 60),
              Offset(mWidth / 5 * 4, mHeight - 60),
              Offset(mWidth, mHeight - 20)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).accentColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
          ClipPath(
            //This one is used for the left blue clipper
            clipper: ShapeClipper(
              [
                Offset(mWidth / 5, mHeight),
                Offset(mWidth / 2, mHeight - 40),
                Offset(mWidth / 5 * 4, mHeight - 80),
                Offset(mWidth, mHeight - 20),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          Center(
            child: Container(
              transform: Matrix4.translationValues(0.0, -mHeight * 0.1, 0.0),
              width: mWidth * 0.8,
              height: mHeight * 0.8,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.red,
              //     width: 1,
              //   ),
              // ),
              child: Image.asset(
                //change image size here
                'assets/images/sitelogo.png',
                scale: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height - 35);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
