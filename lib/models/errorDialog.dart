import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:material_dialogs/widgets/buttons/icon_button.dart';
// import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void showErrorDialog(String Hmessage, String Bmessage, BuildContext context) {
  var size = MediaQuery.of(context).size;
  var mHeight = MediaQuery.of(context).size.height -
      AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  var mWidth = size.width;
  final isLANDSCAPE =
      MediaQuery.of(context).orientation == Orientation.landscape;
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  var lang = AppLocalizations.of(context)!;

  // Widget incompleteEntriesDialog(
  //     double dialogHeight, double dialogWidth, String msg) {
  //   return Container(
  //     height: dialogHeight,
  //     width: dialogWidth,
  //     child: Text(msg),
  //   );
  // }

  showDialog(
      barrierDismissible: false,
      context: context,
      //=============================================Tablet, Portrait=====================================================
      builder: (context) => mWidth > 480
          ? isPortrait
              ? AlertDialog(
                  title: Text(Hmessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: mWidth * 0.04,
                      )),
                  // content: Text(
                  //   Bmessage,
                  //   textAlign: TextAlign.center,
                  // ),
                  // content: incompleteEntriesDialog(
                  //     mHeight * 0.1, mWidth * 0.1, Bmessage),
                  content: Container(
                    height: mHeight * 0.08,
                    width: mWidth * 0.5,
                    child: Center(
                      child: Text(
                        Bmessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: mWidth * 0.04),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mWidth * 0.3,
                          height: mHeight * 0.04,
                          margin: EdgeInsets.only(bottom: mHeight * 0.0075),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                              //add border radius
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(mWidth * 0.01),
                                ),
                              ),
                              // maximumSize: MaterialStateProperty.all(Size(100, 50)),
                            ),
                            child: Text(
                              lang.ok,
                              style: TextStyle(fontSize: mWidth * 0.03),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                  //=============================================Tablet, Landscape=====================================================
                )
              : AlertDialog(
                  title: Text(Hmessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: mWidth * 0.0275,
                      )),
                  content: Container(
                    height: mHeight * 0.175,
                    width: mWidth * 0.35,
                    child: Center(
                      child: Text(
                        Bmessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: mWidth * 0.0225),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mWidth * 0.2,
                          height: mHeight * 0.08,
                          margin: EdgeInsets.only(bottom: mHeight * 0.015),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                              //add border radius
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(mWidth * 0.01),
                                ),
                              ),
                              // maximumSize: MaterialStateProperty.all(Size(100, 50)),
                            ),
                            child: Text(
                              lang.ok,
                              style: TextStyle(fontSize: mWidth * 0.0225),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                  //=============================================Mobile, Portrait=====================================================
                )
          : AlertDialog(
              title: Text(Hmessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                  )),
              content: Text(
                Bmessage,
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      maximumSize: MaterialStateProperty.all(Size(100, 50)),
                    ),
                    child: Text(lang.ok),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
}
//========================================================================================================================================
//==================================================This is for the Notification Dialog===================================================
//========================================================================================================================================

void showErrorDialog1(String Hmessage, String Bmessage, BuildContext context,
    double mWidth, double mHeight) {
  final isLANDSCAPE =
      MediaQuery.of(context).orientation == Orientation.landscape;
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  var lang = AppLocalizations.of(context)!;

  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      //=============================================Tablet, Portrait=====================================================
      child: mWidth > 480
          ? isPortrait
              ? Container(
                  //if language is arabic, then the dialog will be on the right side
                  height:
                      lang.localeName == 'ar' ? mHeight * 0.4 : mHeight * 0.375,
                  width: lang.localeName == 'ar' ? mWidth * 0.6 : mWidth * 0.6,

                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(mWidth * 0.02),
                  ),
                  //this container is for the header message
                  child: Container(
                    child: Column(children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: mHeight * 0.02, bottom: mHeight * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mWidth * 0.02),
                              topRight: Radius.circular(mWidth * 0.02)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          Hmessage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mWidth * 0.06,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mHeight * 0.02,
                      ),
                      //this container is for the body message
                      Container(
                        width: double.infinity,
                        height: mHeight * 0.18,
                        child: Center(
                          child: Text(
                            Bmessage,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: mWidth * 0.04,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mHeight * 0.02,
                      ),
                      //this container is for the button
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                        width: double.infinity,
                        height: mHeight * 0.05,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          child: Text(lang.ok,
                              style: TextStyle(fontSize: mWidth * 0.045)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ]),
                  ),
                )
              //=============================================Tablet, Landscape=====================================================
              : Container(
                  height: mHeight * 0.51,
                  width: mWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(mWidth * 0.02),
                  ),
                  //this container is for the header message
                  child: Container(
                    child: Column(children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: mHeight * 0.02, bottom: mHeight * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mWidth * 0.02),
                              topRight: Radius.circular(mWidth * 0.02)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          Hmessage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mWidth * 0.035,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mHeight * 0.02,
                      ),
                      //this container is for the body message
                      //if the language is arabic, then the size of the text and spaces will differ
                      lang.localeName == 'ar'
                          ? Container(
                              width: double.infinity,
                              height: mHeight * 0.22,
                              child: Center(
                                child: Text(
                                  Bmessage,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: mWidth * 0.025,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: mHeight * 0.25,
                              child: Center(
                                child: Text(
                                  Bmessage,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: mWidth * 0.025,
                                  ),
                                ),
                              ),
                            ),

                      //this container is for the button
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                        width: mWidth * 0.3,
                        height: mHeight * 0.09,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          child: Text(lang.done,
                              style: TextStyle(fontSize: mWidth * 0.03)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ]),
                  ),
                )
          //=============================================Mobile=====================================================
          : Container(
              height: lang.localeName == 'ar' ? mHeight * 0.4 : mHeight * 0.375,
              width: lang.localeName == 'ar' ? mWidth * 0.5 : mWidth * 0.5,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(mWidth * 0.02),
              ),
              //this container is for the header message
              child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: mHeight * 0.025, bottom: mHeight * 0.025),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(mWidth * 0.02),
                          topRight: Radius.circular(mWidth * 0.02)),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      Hmessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mWidth * 0.07,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.02,
                  ),
                  //this container is for the body message
                  Container(
                    width: double.infinity,
                    height: mHeight * 0.17,
                    child: Center(
                      child: Text(
                        Bmessage,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: mWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.02,
                  ),
                  //this container is for the button
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                    width: double.infinity,
                    height: mHeight * 0.055,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        maximumSize: MaterialStateProperty.all(Size(100, 50)),
                      ),
                      child: Text(lang.done,
                          style: TextStyle(fontSize: mWidth * 0.05)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ]),
              ),
            ),
    ),
  );
}

//========================================================================================================================================
//==================================================This is for the Archive Dialog===================================================
//========================================================================================================================================

void showDialoge(BuildContext context, double mHeight, double mWidth) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  var lang = AppLocalizations.of(context)!;
  //=============================================Tablet, portate=====================================================
  mWidth > 480
      ? isPortrait
          ? AwesomeDialog(
              context: context,
              headerAnimationLoop: false,
              dismissOnTouchOutside: false,
              padding: EdgeInsets.symmetric(
                  horizontal: mWidth * 0.01, vertical: mHeight * 0.01),
              width: mWidth * 0.65,
              dialogType: DialogType.infoReverse,
              animType: AnimType.bottomSlide,
              title: LanguageProvider.isEng ? 'Archive' : "أرشفة",
              titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: mWidth * 0.045,
              ),
              desc: LanguageProvider.isEng
                  ? 'Are you sure you want to archive this item?'
                  : "هل أنت متأكد أنك تريد أرشفة هذا العنصر؟",
              descTextStyle: TextStyle(
                color: Colors.black,
                fontSize: mWidth * 0.03,
              ),
              btnCancel: Container(
                margin: EdgeInsets.only(
                    right: mWidth * 0.0025, left: mWidth * 0.005),
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.02, vertical: mHeight * 0.01),
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LanguageProvider.isEng ? lang.cancel : 'إلغاء',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mWidth * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              btnOk: Container(
                margin: EdgeInsets.only(
                    left: mWidth * 0.0025, right: mWidth * 0.005),
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.02, vertical: mHeight * 0.01),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LanguageProvider.isEng ? lang.ok : 'حسنا',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mWidth * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ).show()
          :
          //=============================================Tablet, Landscape=====================================================
          AwesomeDialog(
              context: context,
              headerAnimationLoop: false,
              dismissOnTouchOutside: false,
              padding: EdgeInsets.symmetric(
                  horizontal: mWidth * 0.02, vertical: mHeight * 0.02),
              width: mWidth * 0.425,
              dialogType: DialogType.infoReverse,
              animType: AnimType.bottomSlide,
              title: LanguageProvider.isEng ? 'Archive' : "أرشفة",
              titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: mWidth * 0.03,
              ),
              desc: LanguageProvider.isEng
                  ? 'Are you sure you want to archive this item?'
                  : "هل أنت متأكد أنك تريد أرشفة هذا العنصر؟",
              descTextStyle: TextStyle(
                color: Colors.black,
                fontSize: mWidth * 0.02,
              ),
              btnCancel: Container(
                margin: EdgeInsets.only(
                    bottom: mHeight * 0.02,
                    right: mWidth * 0.0025,
                    left: mWidth * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.03, vertical: mHeight * 0.02),
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    lang.cancel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mWidth * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              btnOk: Container(
                margin: EdgeInsets.only(
                    bottom: mHeight * 0.02,
                    left: mWidth * 0.0025,
                    right: mWidth * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.02, vertical: mHeight * 0.02),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    lang.ok,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mWidth * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ).show()
      :
      //=============================================Mobile=====================================================
      AwesomeDialog(
          context: context,
          dismissOnTouchOutside: false,
          dialogType: DialogType.infoReverse,
          animType: AnimType.bottomSlide,
          headerAnimationLoop: false,
          title: LanguageProvider.isEng ? 'Archive' : 'أرشيف',
          desc: LanguageProvider.isEng
              ? 'Are you sure you want to archive this item?'
              : 'هل أنت متأكد أنك تريد أرشفة هذا العنصر؟',
          btnOkColor: Theme.of(context).primaryColor,
          btnCancelText: LanguageProvider.isEng ? lang.cancel : 'إلغاء',
          btnOkText: LanguageProvider.isEng ? lang.ok : 'حسنا',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
}

//========================================================================================================================================
//==================================================This is for the Notes Dialog===================================================
//========================================================================================================================================
void showDialoge1(BuildContext context, double mHeight, double mWidth) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  var lang = AppLocalizations.of(context)!;
  //=============================================Tablet, Portrait=====================================================
  mWidth > 480
      ? isPortrait
          ? showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: mWidth * 0.02, vertical: mHeight * 0.01),
                  height: mHeight * 0.29,
                  width: mWidth * 0.6,
                  child: Column(
                    children: [
                      Container(
                        //Create a container for the title
                        padding: EdgeInsets.symmetric(
                            horizontal: mWidth * 0.03,
                            vertical: mHeight * 0.01),
                        child: Text(
                          //  LanguageProvider.isEng ? 'Add Notes' : 'أضف ملاحظات',
                          LanguageProvider.isEng ? "Add Notes" : 'أضف ملاحظات',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: mWidth * 0.045,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mWidth * 0.03,
                            vertical: mHeight * 0.01),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: mWidth * 0.0275,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: InputDecoration(
                            // hintText: LanguageProvider.isEng ? 'Enter your notes here': 'أدخل ملاحظاتك هنا',
                            hintText: LanguageProvider.isEng
                                ? 'Enter your notes here'
                                : 'أدخل ملاحظاتك هنا',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: mWidth * 0.03,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                mWidth * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mWidth * 0.03,
                            vertical: mHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: mWidth * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: mWidth * 0.04,
                                  vertical: mHeight * 0.0125),
                              decoration: BoxDecoration(
                                color: Colors.red[500],
                                borderRadius: BorderRadius.circular(
                                  mWidth * 0.02,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  lang.cancel,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mWidth * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: mWidth * 0.0025, right: mWidth * 0.02),
                              padding: EdgeInsets.symmetric(
                                  horizontal: mWidth * 0.04,
                                  vertical: mHeight * 0.0125),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  mWidth * 0.02,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  lang.ok,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mWidth * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          //=============================================Tablet, Landscape=====================================================
          : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(mWidth * 0.02),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: mWidth * 0.01, vertical: mHeight * 0.01),
                    height: mHeight * 0.475,
                    width: mWidth * 0.4,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: mHeight * 0.01, top: mHeight * 0.01),
                          //Create a container for the title
                          padding: EdgeInsets.symmetric(
                              horizontal: mWidth * 0.03,
                              vertical: mHeight * 0.01),
                          child: Text(
                            LanguageProvider.isEng
                                ? 'Add Notes'
                                : 'أضف ملاحظات',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: mWidth * 0.03,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: mWidth * 0.03,
                              vertical: mHeight * 0.01),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: mWidth * 0.02,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: LanguageProvider.isEng
                                  ? 'Enter your notes here'
                                  : 'أدخل ملاحظاتك هنا',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: mWidth * 0.02,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  mWidth * 0.02,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: mHeight * 0.01),
                        //This is the container for the buttons
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: mHeight * 0.08,
                                margin: lang.localeName == 'en'
                                    ? EdgeInsets.only(
                                        left: mWidth * 0.01,
                                        right: mWidth * 0.01)
                                    : EdgeInsets.only(
                                        left: mWidth * 0.01,
                                        right: mWidth * 0.01),
                                padding: EdgeInsets.symmetric(
                                    horizontal: mWidth * 0.04,
                                    vertical: mHeight * 0.013),
                                decoration: BoxDecoration(
                                  color: Colors.red[500],
                                  borderRadius: BorderRadius.circular(
                                    mWidth * 0.01,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Center(
                                    child: Text(
                                      lang.cancel,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mWidth * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: mHeight * 0.08,
                                margin: EdgeInsets.only(left: mWidth * 0.005),
                                padding: EdgeInsets.symmetric(
                                    horizontal: mWidth * 0.04,
                                    vertical: mHeight * 0.013),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    mWidth * 0.01,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    lang.ok,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mWidth * 0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
      //=============================================Mobile=====================================================
      : AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.noHeader,
          body: Column(
            children: [
              Container(
                //Create a container for the title
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.03, vertical: mHeight * 0.01),
                child: Text(
                  LanguageProvider.isEng ? 'Add Notes' : 'أضف ملاحظات',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: mWidth * 0.055,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: mWidth * 0.03, vertical: mHeight * 0.01),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText:
                        LanguageProvider.isEng ? 'Add Notes' : 'أضف ملاحظات',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: mWidth * 0.03,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(mWidth * 0.02),
                    ),
                  ),
                ),
              ),
            ],
          ),
          btnCancelOnPress: () {},
          btnCancelIcon: Icons.cancel,
          btnCancelText: LanguageProvider.isEng ? 'Cancel' : 'إلغاء',
          btnOkOnPress: () {},
          btnOkText: LanguageProvider.isEng ? 'Ok' : 'حسنا',
          btnOkIcon: Icons.check_circle,
          btnOkColor: Theme.of(context).primaryColor,
        ).show();
}
