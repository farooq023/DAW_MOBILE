import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../screens/Login2.dart';

class LoginBtn extends StatelessWidget {
  double mheight;
  double mwidth;

  VoidCallback submit;
  LoginBtn(this.mheight, this.mwidth, this.submit);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    final isLANDSCAPE =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    //Tablet, portrait
    return mwidth > 480
        ? isPortrait
            ? Container(
                width: mwidth * 0.4,
                height: mheight * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.00),
                  // color: Color.fromRGBO(11, 94, 255, 1),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  //Add text to the button
                  icon: Text(
                    // "تسجيل الدخول",
                    lang.logIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mwidth * 0.04,
                    ),
                  ),
                  onPressed: submit,
                ),
              )
            //Tablet, landscape
            : Container(
                width: mwidth * 0.25,
                height: mheight * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mwidth * 0.02),
                  // color: Color.fromRGBO(11, 94, 255, 1),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  //Add text to the button
                  icon: Text(
                    // "تسجيل الدخول",
                    lang.logIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mwidth * 0.025,
                    ),
                  ),
                  onPressed: submit,
                ),
              )
        //width < 480 == mobile
        : Container(
            width: mwidth * 0.5,
            height: mheight * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              // color: Color.fromRGBO(11, 94, 255, 1),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              //Add text to the button
              icon: Text(
                // "تسجيل الدخول",
                lang.logIn,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mwidth * 0.05,
                ),
              ),
              onPressed: submit,
            ),
          );
  }
}
