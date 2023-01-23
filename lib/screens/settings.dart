import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/languageProvider.dart';
import './Login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController urlCtrl = TextEditingController();

  TextEditingController hostCtrl = TextEditingController();

  final hostFocusNode = FocusNode();

  List<Widget> languages = const [
    Text("English"),
    Text("عربي"),
  ];
  List<bool> selectedLang = [true, false];
  List<bool> selectedScreen = [true, false];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    var marginTop = mHeight * 0.020;
    final isLANDSCAPE =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var fontsize = mWidth * 0.015;

    if (mWidth < 481) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    // var locale = AppLocalizations.of(context)!;

    List<Widget> screens = [
      Text(AppLocalizations.of(context)!.dashboard),
      Text(AppLocalizations.of(context)!.inbox),
    ];

    void focusOnHost(_) {
      FocusScope.of(context).requestFocus(hostFocusNode);
    }

    void switchtoEng() {
      // Navigator.pushReplacementNamed(context, ModalRoute.of(context)!.settings.name!);
      Provider.of<LanguageProvider>(context, listen: false).changeToEng();
    }

    void switchtoAr() {
      // Navigator.pushReplacementNamed(context, ModalRoute.of(context)!.settings.name!);
      Provider.of<LanguageProvider>(context, listen: false).changeToAr();
    }

    var lang = AppLocalizations.of(context)!;

    return mWidth > 480
        ? isPortrait
            ?
            //======================This is for the portrait mode, Tablet and Desktop=============================
            Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipper: ProsteBezierCurve(
                                  position: ClipPosition.bottom,
                                  list: [
                                    BezierCurveSection(
                                      start: Offset(0, 390),
                                      top: Offset(mWidth / 4, 330),
                                      end: Offset(mWidth / 2, 350),
                                    ),
                                    BezierCurveSection(
                                      start: Offset(mWidth / 2, -350),
                                      top: Offset(mWidth / 4 * 3, 200),
                                      end: Offset(mWidth, 320),
                                    ),
                                  ],
                                ),
                                child: Container(
                                    height: mHeight * 0.35,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              // SizedBox(
                              //   width: double.infinity,
                              //   child: TextLiquidFill(
                              //       // text: 'LIQUIDY',
                              //       text: lang.morasalaat,
                              //       waveColor: Theme.of(context).primaryColor,
                              //       waveDuration: Duration(seconds: 2),
                              //       boxBackgroundColor:
                              //           Theme.of(context).primaryColorLight,
                              //       textStyle: TextStyle(
                              //         // fontSize: 40.0,
                              //         fontSize: mWidth * 0.12,

                              //         fontWeight: FontWeight.w400,
                              //         fontFamily: 'Roboto',
                              //       ),
                              //       boxWidth: double.infinity,
                              //       boxHeight: mHeight * 0.185),
                              // ),
                              Center(
                                child: Image.asset(
                                  "assets/images/Mersal1.png",
                                  scale: mWidth * 0.0016,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                              // height: mHeight * 0.01,
                              ),
                          //This container is the main container that contains all the settings widgets
                          Container(
                            width: mWidth * 0.7,
                            child: Column(
                              children: [
                                TextField(
                                  controller: urlCtrl,
                                  onSubmitted: focusOnHost,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: mHeight * 0.0225),
                                    prefixIcon:
                                        Icon(Icons.link, size: mWidth * 0.05),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: mWidth * 0.09,
                                    ),
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).backgroundColor,
                                    // labelText: lang.enterURL,
                                    labelText: lang.enterURL,
                                    labelStyle:
                                        TextStyle(fontSize: mWidth * 0.035),
                                  ),
                                  style: TextStyle(fontSize: mWidth * 0.035),
                                ),
                                SizedBox(
                                  height: mHeight * 0.0009,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: marginTop),
                                  child: TextField(
                                    controller: hostCtrl,
                                    textInputAction: TextInputAction.done,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: mHeight * 0.0225),
                                      prefixIcon: Icon(Icons.web_asset,
                                          size: mWidth * 0.05),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: mWidth * 0.09,
                                      ),
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(10),
                                      // ),
                                      filled: true,
                                      fillColor:
                                          Theme.of(context).backgroundColor,
                                      // labelText: lang.enterHost,
                                      labelText: lang.enterHost,
                                      labelStyle:
                                          TextStyle(fontSize: mWidth * 0.035),
                                    ),
                                    style: TextStyle(fontSize: mWidth * 0.035),
                                  ),
                                ),
                                //This container is the container that contains the language header + icon
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: marginTop * 2.5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        radius: mWidth * 0.04,
                                        child: Icon(
                                          Icons.language,
                                          color: Colors.white,
                                          size: mWidth * 0.05,
                                        ),
                                      ),
                                      SizedBox(width: mWidth * 0.05),
                                      Text(
                                        // lang.language,
                                        // "Language",
                                        lang.language,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: mWidth * 0.045,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //This container is the container that contains the language toggle buttons
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: marginTop),
                                  child: ToggleButtons(
                                    // direction: vertical ? Axis.vertical : Axis.horizontal,
                                    onPressed: (int index) {
                                      setState(() {
                                        // The button that is tapped is set to true, and the others to false.
                                        for (int i = 0;
                                            i < selectedLang.length;
                                            i++) {
                                          selectedLang[i] = i == index;
                                        }
                                        if (index == 0)
                                          switchtoEng();
                                        else
                                          switchtoAr();
                                      });
                                    },
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(mWidth * 0.01)),
                                    selectedBorderColor:
                                        Theme.of(context).primaryColor,
                                    selectedColor: Colors.white,
                                    // fillColor: Color.fromARGB(255, 72, 126, 181),
                                    fillColor: Theme.of(context).primaryColor,
                                    // color: Colors.red[400],
                                    color: Theme.of(context).primaryColor,
                                    // constraints: const BoxConstraints(minHeight: 45.0, minWidth: 278, maxWidth: double.infinity),
                                    constraints: BoxConstraints(
                                        minHeight: mHeight * 0.05,
                                        minWidth: mWidth * 0.3475,
                                        maxWidth: double.infinity),
                                    isSelected: selectedLang,
                                    textStyle:
                                        TextStyle(fontSize: mWidth * 0.035),
                                    children: languages,
                                  ),
                                ),
                                //This container is the container that contains the screen header + icon
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: marginTop * 2.5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        radius: mWidth * 0.04,
                                        child: Icon(
                                          Icons.home,
                                          color: Colors.white,
                                          size: mWidth * 0.05,
                                        ),
                                      ),
                                      SizedBox(width: mWidth * 0.05),
                                      Text(
                                        lang.mainScreen,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: mWidth * 0.045,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: marginTop),
                                  child: ToggleButtons(
                                    // direction: vertical ? Axis.vertical : Axis.horizontal,
                                    onPressed: (int index) {
                                      setState(() {
                                        // The button that is tapped is set to true, and the others to false.
                                        for (int i = 0;
                                            i < selectedScreen.length;
                                            i++) {
                                          selectedScreen[i] = i == index;
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(mWidth * 0.01)),
                                    selectedBorderColor:
                                        Theme.of(context).primaryColor,
                                    selectedColor: Colors.white,
                                    // fillColor: Color.fromARGB(255, 72, 126, 181),
                                    fillColor: Theme.of(context).primaryColor,
                                    // color: Colors.red[400],
                                    color: Theme.of(context).primaryColor,
                                    constraints: BoxConstraints(
                                        minHeight: mHeight * 0.05,
                                        minWidth: mWidth * 0.3475,
                                        maxWidth: double.infinity),
                                    textStyle:
                                        TextStyle(fontSize: mWidth * 0.035),
                                    isSelected: selectedScreen,
                                    children: screens,
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(top: marginTop * 3),
                                //   width: double.infinity,
                                //   height: mHeight * 0.0525,
                                //   child: ElevatedButton(
                                //     style: ElevatedButton.styleFrom(
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(
                                //             mWidth * 0.01),
                                //         side: BorderSide(
                                //             color:
                                //                 Theme.of(context).primaryColor),
                                //       ),
                                //       backgroundColor:
                                //           Theme.of(context).primaryColorLight,
                                //     ),
                                //     onPressed: () {
                                //       Navigator.pushReplacementNamed(
                                //           context, Login.routeName);
                                //     },
                                //     child: Text(
                                //       lang.done,
                                //       // locale.done,
                                //       style: TextStyle(
                                //           fontSize: mWidth * 0.045,
                                //           color:
                                //               Theme.of(context).primaryColor),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: mHeight * 0.03),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (lang.localeName == "en")
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, Login.routeName);
                                        },
                                        child: Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: mWidth * 0.11,
                                        ),
                                      ),
                                    if (lang.localeName == "ar")
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, Login.routeName);
                                        },
                                        child: Icon(
                                          Icons.arrow_circle_left_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: mWidth * 0.11,
                                        ),
                                      ),
                                  ],
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
            //======================This is for the landscape mode, Tablet and Desktop=============================
            : Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipper: ProsteBezierCurve(
                                  position: ClipPosition.bottom,
                                  list: [
                                    BezierCurveSection(
                                      start: Offset(0, 380),
                                      top: Offset(mWidth / 4, 280),
                                      end: Offset(mWidth / 2, 300),
                                    ),
                                    BezierCurveSection(
                                      start: Offset(mWidth / 2, -550),
                                      top: Offset(mWidth / 4 * 3, 105),
                                      end: Offset(mWidth, 270),
                                    ),
                                  ],
                                ),
                                child: Container(
                                    height: mHeight * 0.475,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/Mersal1.png",
                                  scale: mWidth * 0.0012,
                                ),
                              ),
                            ],
                          ),
                          // Image.asset(
                          //   "assets/images/marsalaat2.png",
                          //   scale: mWidth * 0.0005,
                          // ),
                          SizedBox(
                            height: mHeight * 0.02,
                          ),
                          //This container is the main container that contains all the settings widgets
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: mWidth * 0.015),
                              Container(
                                width: mWidth * 0.45,
                                height: mHeight * 0.6,
                                child: Column(
                                  children: [
                                    //This container is the container that contains the language header + icon
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.only(top: marginTop * 2.5),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            radius: mWidth * 0.02,
                                            child: Icon(
                                              Icons.language,
                                              color: Colors.white,
                                              size: mWidth * 0.025,
                                            ),
                                          ),
                                          SizedBox(width: mWidth * 0.03),
                                          Text(
                                            lang.language,
                                            // "Language",
                                            // AppLocalizations.of(context)!.language,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: mWidth * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //This container is the container that contains the language toggle buttons
                                    SizedBox(height: mHeight * 0.02),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: marginTop),
                                      child: ToggleButtons(
                                        // direction: vertical ? Axis.vertical : Axis.horizontal,
                                        onPressed: (int index) {
                                          setState(() {
                                            // The button that is tapped is set to true, and the others to false.
                                            for (int i = 0;
                                                i < selectedLang.length;
                                                i++) {
                                              selectedLang[i] = i == index;
                                            }
                                            if (index == 0)
                                              switchtoEng();
                                            else
                                              switchtoAr();
                                          });
                                        },
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(mWidth * 0.01)),
                                        selectedBorderColor:
                                            Theme.of(context).primaryColor,
                                        selectedColor: Colors.white,
                                        // fillColor: Color.fromARGB(255, 72, 126, 181),
                                        fillColor:
                                            Theme.of(context).primaryColor,
                                        // color: Colors.red[400],
                                        color: Theme.of(context).primaryColor,
                                        constraints: BoxConstraints(
                                            minHeight: mHeight * 0.09,
                                            minWidth: mWidth * 0.22,
                                            maxWidth: double.infinity),
                                        isSelected: selectedLang,
                                        children: languages,
                                        textStyle:
                                            TextStyle(fontSize: mWidth * 0.02),
                                      ),
                                    ),
                                    //This container is the container that contains the screen header + icon
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.only(top: marginTop * 2.5),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            radius: mWidth * 0.02,
                                            child: Icon(
                                              Icons.home,
                                              color: Colors.white,
                                              size: mWidth * 0.03,
                                            ),
                                          ),
                                          SizedBox(width: mWidth * 0.03),
                                          Text(
                                            lang.mainScreen,
                                            // "Language",
                                            // AppLocalizations.of(context)!.language,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: mWidth * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: mHeight * 0.021),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: marginTop),
                                      child: ToggleButtons(
                                        // direction: vertical ? Axis.vertical : Axis.horizontal,
                                        onPressed: (int index) {
                                          setState(() {
                                            // The button that is tapped is set to true, and the others to false.
                                            for (int i = 0;
                                                i < selectedScreen.length;
                                                i++) {
                                              selectedScreen[i] = i == index;
                                            }
                                          });
                                        },
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(mWidth * 0.01)),
                                        selectedBorderColor:
                                            Theme.of(context).primaryColor,
                                        selectedColor: Colors.white,
                                        // fillColor: Color.fromARGB(255, 72, 126, 181),
                                        fillColor:
                                            Theme.of(context).primaryColor,
                                        // color: Colors.red[400],
                                        color: Theme.of(context).primaryColor,
                                        constraints: BoxConstraints(
                                            minHeight: mHeight * 0.09,
                                            minWidth: mWidth * 0.22,
                                            maxWidth: double.infinity),
                                        isSelected: selectedScreen,
                                        children: screens,
                                        textStyle:
                                            TextStyle(fontSize: mWidth * 0.02),
                                      ),
                                    ),
                                    // Container(
                                    //   //add boder radius to the button

                                    //   margin: EdgeInsets.only(
                                    //       top: marginTop * 3,
                                    //       bottom: mHeight * 0.04),
                                    //   width: mWidth * 0.175,
                                    //   height: mHeight * 0.09,
                                    //   child: ElevatedButton(
                                    //     style: ElevatedButton.styleFrom(
                                    //       backgroundColor:
                                    //           Theme.of(context).primaryColor,
                                    //       //add boder radius to the button
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.circular(
                                    //             mWidth * 0.02),
                                    //       ),
                                    //     ),
                                    //     onPressed: () {
                                    //       Navigator.pushReplacementNamed(
                                    //           context, Login.routeName);
                                    //     },
                                    //     child: Text(
                                    //       lang.done,
                                    //       style: TextStyle(
                                    //           fontSize: mWidth * 0.022),
                                    //       // locale.done,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(width: mWidth * 0.015),
                              //add another container to the stack
                              Container(
                                width: mWidth * 0.4,
                                child: Column(
                                  children: [
                                    Container(
                                      width: mWidth * 0.45,
                                      child: TextField(
                                        controller: urlCtrl,
                                        onSubmitted: focusOnHost,
                                        textInputAction: TextInputAction.next,
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: mHeight * 0.04),
                                          prefixIcon: Icon(Icons.link,
                                              size: mWidth * 0.03),
                                          prefixIconConstraints: BoxConstraints(
                                            minWidth: mWidth * 0.07,
                                          ),
                                          // border: OutlineInputBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(10),
                                          // ),
                                          filled: true,
                                          fillColor:
                                              Theme.of(context).backgroundColor,
                                          // labelText: lang.enterURL,
                                          labelText: lang.enterURL,
                                          labelStyle: TextStyle(
                                              fontSize: mWidth * 0.02),
                                        ),
                                        style:
                                            TextStyle(fontSize: mWidth * 0.02),
                                      ),
                                    ),
                                    Container(
                                      width: mWidth * 0.45,
                                      margin: EdgeInsets.only(
                                          top: marginTop + mWidth * 0.01),
                                      child: TextField(
                                        controller: hostCtrl,
                                        textInputAction: TextInputAction.done,
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: mHeight * 0.04),
                                          prefixIcon: Icon(Icons.web_asset,
                                              size: mWidth * 0.03),
                                          prefixIconConstraints: BoxConstraints(
                                            minWidth: mWidth * 0.07,
                                          ),
                                          // border: OutlineInputBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(10),
                                          // ),
                                          filled: true,
                                          fillColor:
                                              Theme.of(context).backgroundColor,
                                          // labelText: lang.enterHost,
                                          labelText: lang.enterHost,
                                          labelStyle: TextStyle(
                                              fontSize: mWidth * 0.02),
                                        ),
                                        style:
                                            TextStyle(fontSize: mWidth * 0.02),
                                      ),
                                    ),
                                    SizedBox(height: mHeight * 0.04),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (lang.localeName == "en")
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                  context, Login.routeName);
                                            },
                                            child: Icon(
                                              Icons.arrow_circle_right_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: mWidth * 0.065,
                                            ),
                                          ),
                                        if (lang.localeName == "ar")
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                  context, Login.routeName);
                                            },
                                            child: Icon(
                                              Icons.arrow_circle_left_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: mWidth * 0.065,
                                            ),
                                          ),
                                      ],
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(
                                    //       top: marginTop * 3,
                                    //       bottom: mHeight * 0.04),
                                    //   width: double.infinity,
                                    //   height: mHeight * 0.085,
                                    //   child: ElevatedButton(
                                    //     style: ElevatedButton.styleFrom(
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.circular(
                                    //             mWidth * 0.01),
                                    //         side: BorderSide(
                                    //             color: Theme.of(context)
                                    //                 .primaryColor),
                                    //       ),
                                    //       backgroundColor: Theme.of(context)
                                    //           .primaryColorLight,
                                    //     ),
                                    //     onPressed: () {
                                    //       Navigator.pushReplacementNamed(
                                    //           context, Login.routeName);
                                    //     },
                                    //     child: Text(
                                    //       lang.done,
                                    //       // locale.done,
                                    //       style: TextStyle(
                                    //           fontSize: mWidth * 0.025,
                                    //           color: Theme.of(context)
                                    //               .primaryColor),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(width: mWidth * 0.015),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
        //======================This is for the portrait mode, Mobile=============================
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipPath(
                            clipper: ProsteBezierCurve(
                              position: ClipPosition.bottom,
                              list: [
                                BezierCurveSection(
                                  start: Offset(0, 210), //175
                                  top: Offset(mWidth / 4, 220), //190
                                  end: Offset(mWidth / 2, 205), //170
                                ),
                                BezierCurveSection(
                                  start: Offset(mWidth / 2, -110),
                                  top: Offset(mWidth / 4 * 3, 115),
                                  end: Offset(mWidth, 215),
                                ),
                              ],
                            ),
                            child: Container(
                                height: mHeight * 0.34,
                                color: Theme.of(context).primaryColorLight),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/Mersal1.png",
                              scale: mWidth * 0.0057,
                            ),
                          ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: TextLiquidFill(
                          //       // text: 'LIQUIDY',
                          //       text: lang.morasalaat,
                          //       waveColor: Theme.of(context).primaryColor,
                          //       waveDuration: Duration(seconds: 2),
                          //       boxBackgroundColor:
                          //           Theme.of(context).primaryColorLight,
                          //       textStyle: TextStyle(
                          //         // fontSize: 40.0,
                          //         fontSize: mWidth * 0.175,

                          //         fontWeight: FontWeight.w400,
                          //         fontFamily: 'Roboto',
                          //       ),
                          //       boxWidth: double.infinity,
                          //       boxHeight: mHeight * 0.222),
                          // ),
                        ],
                      ),
                      // Image.asset(
                      //   "assets/images/marsalaat2.png",
                      //   scale: mWidth * 0.0025,
                      // ),
                      // SizedBox(
                      //   width: 250.0,
                      //   child: TextLiquidFill(
                      //     text: 'LIQUIDY',
                      //     waveColor: Colors.blueAccent,
                      //     boxBackgroundColor: Colors.redAccent,
                      //     textStyle: TextStyle(
                      //       fontSize: 80.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     boxHeight: 300.0,
                      //   ),
                      // ),
                      SizedBox(height: mHeight * 0.035),
                      //This container is the main container that contains all the settings widgets
                      Container(
                        width: mWidth * 0.8,
                        child: Column(
                          children: [
                            TextField(
                              controller: urlCtrl,
                              onSubmitted: focusOnHost,
                              textInputAction: TextInputAction.next,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide: BorderSide(
                                //       color: Theme.of(context).primaryColor),
                                // ),
                                // labelStyle: TextStyle(
                                //     color: Theme.of(context).primaryColor),
                                prefixIcon: Icon(
                                  Icons.link,
                                ),
                                // border: OutlineInputBorder(
                                //   borderRadius:
                                //       BorderRadius.circular(mWidth * 0.02),
                                // ),
                                filled: true,
                                fillColor: Theme.of(context).backgroundColor,
                                labelText: lang.enterURL,
                              ),
                            ),
                            SizedBox(height: mHeight * 0.01),
                            Container(
                              margin: EdgeInsets.only(top: marginTop),
                              child: TextField(
                                controller: hostCtrl,
                                textInputAction: TextInputAction.done,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.web_asset,
                                  ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius:
                                  //       BorderRadius.circular(mWidth * 0.02),
                                  // ),
                                  filled: true,
                                  fillColor: Theme.of(context).backgroundColor,
                                  labelText: lang.enterHost,
                                ),
                              ),
                            ),
                            //This container is the container that contains the language header + icon
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: marginTop * 2.5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    radius: mWidth * 0.05,
                                    child: Icon(
                                      Icons.language,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: mWidth * 0.05),
                                  Text(
                                    // lang.language,
                                    // "Language",
                                    lang.language,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: mWidth * 0.05,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //This container is the container that contains the language toggle buttons
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: marginTop),
                                child: ToggleButtons(
                                  // direction: vertical ? Axis.vertical : Axis.horizontal,
                                  onPressed: (int index) {
                                    setState(() {
                                      // The button that is tapped is set to true, and the others to false.
                                      for (int i = 0;
                                          i < selectedLang.length;
                                          i++) {
                                        selectedLang[i] = i == index;
                                      }
                                      if (index == 0)
                                        switchtoEng();
                                      else
                                        switchtoAr();
                                    });
                                  },
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(mWidth * 0.02)),
                                  selectedBorderColor:
                                      Theme.of(context).primaryColor,
                                  selectedColor: Colors.white,
                                  // fillColor: Color.fromARGB(255, 72, 126, 181),
                                  fillColor: Theme.of(context).primaryColor,
                                  // color: Colors.red[400],
                                  color: Theme.of(context).primaryColor,
                                  constraints: BoxConstraints(
                                    minHeight: mHeight * 0.06,
                                    minWidth: mWidth * 0.39,
                                    maxWidth: double.infinity,
                                  ),
                                  isSelected: selectedLang,
                                  children: languages,
                                ),
                              ),
                            ),
                            //This container is the container that contains the screen header + icon
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: marginTop * 2.5),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      radius: mWidth * 0.05,
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: mWidth * 0.05),
                                    Text(
                                      lang.mainScreen,
                                      // "Language",
                                      // AppLocalizations.of(context)!.language,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: mWidth * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: marginTop),
                              child: ToggleButtons(
                                // direction: vertical ? Axis.vertical : Axis.horizontal,
                                onPressed: (int index) {
                                  setState(() {
                                    // The button that is tapped is set to true, and the others to false.
                                    for (int i = 0;
                                        i < selectedScreen.length;
                                        i++) {
                                      selectedScreen[i] = i == index;
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.all(
                                    Radius.circular(mWidth * 0.02)),
                                selectedBorderColor:
                                    Theme.of(context).primaryColor,
                                selectedColor: Colors.white,
                                // fillColor: Color.fromARGB(255, 72, 126, 181),
                                fillColor: Theme.of(context).primaryColor,
                                // color: Colors.red[400],
                                color: Theme.of(context).primaryColor,
                                constraints: BoxConstraints(
                                  minHeight: mHeight * 0.06,
                                  minWidth: mWidth * 0.39,
                                  maxWidth: double.infinity,
                                ),
                                isSelected: selectedScreen,
                                children: screens,
                              ),
                            ),
                            SizedBox(height: mHeight * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //Create two children, one is text and the other is icon button
                              children: [
                                // Text(
                                //   lang.done,
                                //   style: TextStyle(
                                //     color: Theme.of(context).primaryColor,
                                //     fontSize: mWidth * 0.06,
                                //   ),
                                // ),
                                if (lang.localeName == "en")
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, Login.routeName);
                                    },
                                    child: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Theme.of(context).primaryColor,
                                      size: mWidth * 0.135,
                                    ),
                                  ),
                                if (lang.localeName == "ar")
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, Login.routeName);
                                    },
                                    child: Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Theme.of(context).primaryColor,
                                      size: mWidth * 0.135,
                                    ),
                                  ),
                              ],
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(top: marginTop * 2.5),
                            //   width: mWidth * 0.425,
                            //   height: mHeight * 0.0675,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius:
                            //             BorderRadius.circular(mWidth * 0.03),
                            //         side: BorderSide(
                            //             color: Theme.of(context)
                            //                 .primaryColorLight),
                            //       ),
                            //       backgroundColor:
                            //           Theme.of(context).primaryColor,
                            //     ),
                            //     onPressed: () {
                            //       Navigator.pushReplacementNamed(
                            //           context, Login.routeName);
                            //     },
                            //     child: Text(
                            //       lang.done,
                            //       // locale.done,
                            //       style: TextStyle(
                            //           fontSize: mWidth * 0.045,
                            //           color: Colors.white),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
