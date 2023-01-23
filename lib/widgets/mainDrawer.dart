import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/languageProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class appDrawer extends StatefulWidget {
  double mHeight;
  double mWidth;

  appDrawer(this.mHeight, this.mWidth);
  @override
  State<appDrawer> createState() => _appDrawerState();
}

class _appDrawerState extends State<appDrawer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var newHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var newWidth = size.width;
    final isLANDSCAPE = MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var lang = AppLocalizations.of(context)!;

    return newWidth > 480
        ? isPortrait
            ?
            //==============================================Tablet, portrait==============================================
            Drawer(
                width: widget.mWidth * 0.4,
                backgroundColor: Color.fromARGB(229, 252, 252, 252),
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                        height: widget.mHeight * 0.25,
                        //add a linear gradient to the drawer
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            //Colors for the gradient should be light blue, light gray and white
                            colors: [
                              Colors.blue[100]!,
                              Colors.grey[100]!,
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                            height: widget.mHeight * 0.2,
                            child: Image.asset(
                              'assets/images/profile.png',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.username,
                                  style: TextStyle(fontSize: widget.mWidth * 0.03, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  lang.email,
                                  style: TextStyle(fontSize: widget.mWidth * 0.02, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.02,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.dashboard, size: widget.mWidth * 0.035, color: Colors.black),
                      title: Text(lang.dashboard,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.025,
                          )),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/dashboard');
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.inbox, size: widget.mWidth * 0.035, color: Colors.black),
                      title: Text(lang.inbox,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.025,
                          )),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/inbox2');
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.send, size: widget.mWidth * 0.035, color: Colors.black),
                      title: Text(
                        lang.sent,
                        style: TextStyle(
                          fontSize: widget.mWidth * 0.025,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/sent');
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.language, size: widget.mWidth * 0.035, color: Colors.black),
                      title: Text(
                        lang.changeLang,
                        style: TextStyle(
                          fontSize: widget.mWidth * 0.025,
                        ),
                      ),
                      onTap: () {
                        Provider.of<LanguageProvider>(context, listen: false).switchLanguage();
                      },
                    ),
                    // Divider(
                    //   thickness: 1,
                    // ),
                    // ListTile(
                    //   horizontalTitleGap: widget.mWidth * 0.01,
                    //   leading: Icon(Icons.view_cozy_outlined, size: widget.mWidth * 0.035, color: Colors.black),
                    //   title: Text(
                    //     lang.viewPdf,
                    //     style: TextStyle(
                    //       fontSize: widget.mWidth * 0.025,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.of(context).pushReplacementNamed('/pdfkit');
                    //   },
                    // ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.exit_to_app, size: widget.mWidth * 0.035, color: Colors.black),
                      title: Text(
                        lang.logOut,
                        style: TextStyle(
                          fontSize: widget.mWidth * 0.025,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                  ],
                ),
                //==============================================Tablet, landscape==============================================
              )
            : Drawer(
                width: widget.mWidth * 0.7,
                backgroundColor: Color.fromARGB(229, 252, 252, 252),
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                        height: widget.mHeight * 0.175,
                        //add a linear gradient to the drawer
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            //Colors for the gradient should be light blue, light gray and white
                            colors: [
                              Colors.blue[100]!,
                              Colors.grey[100]!,
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                              height: widget.mHeight * 0.125,
                              child: Image.asset(
                                'assets/images/profile.png',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang.username,
                                    style: TextStyle(fontSize: widget.mWidth * 0.06, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    lang.email,
                                    style: TextStyle(fontSize: widget.mWidth * 0.04, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.dashboard, size: widget.mWidth * 0.05, color: Colors.black),
                      title: Text(lang.dashboard,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.04,
                          )),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/dashboard');
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.inbox, size: widget.mWidth * 0.05, color: Colors.black),
                      title: Text(lang.inbox,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.04,
                          )),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/inbox2');
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.send, size: widget.mWidth * 0.05, color: Colors.black),
                      title: Text(
                        lang.sent,
                        style: TextStyle(
                          fontSize: widget.mWidth * 0.04,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/sent');
                      },
                    ),
                    // Divider(
                    //   thickness: 1,
                    // ),
                    // ListTile(
                    //   horizontalTitleGap: widget.mWidth * 0.01,
                    //   leading: Icon(Icons.view_cozy_outlined, size: widget.mWidth * 0.05, color: Colors.black),
                    //   title: Text(
                    //     lang.viewPdf,
                    //     style: TextStyle(
                    //       fontSize: widget.mWidth * 0.04,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.of(context).pushReplacementNamed('/pdfkit');
                    //   },
                    // ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.language, size: widget.mWidth * 0.05, color: Colors.black),
                      title: Text(lang.changeLang,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.04,
                          )),
                      onTap: () {
                        // Navigator.of(context).pushReplacementNamed('/login');
                        Provider.of<LanguageProvider>(context, listen: false).switchLanguage();
                      },
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: widget.mHeight * 0.01,
                    ),
                    ListTile(
                      horizontalTitleGap: widget.mWidth * 0.01,
                      leading: Icon(Icons.exit_to_app, size: widget.mWidth * 0.05, color: Colors.black),
                      title: Text(lang.logOut,
                          style: TextStyle(
                            fontSize: widget.mWidth * 0.04,
                          )),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                  ],
                ),
              )
        //==============================================mobile, portrait==============================================
        : Drawer(
            width: widget.mWidth * 0.4,
            backgroundColor: Color.fromARGB(229, 252, 252, 252),
            child: Column(children: [
              SafeArea(
                child: Container(
                  height: widget.mHeight * 0.25,
                  //add a linear gradient to the drawer
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //Colors for the gradient should be light blue, light gray and white
                      colors: [
                        Colors.blue[100]!,
                        Colors.grey[100]!,
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                        height: widget.mHeight * 0.2,
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: widget.mWidth * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.username,
                              style: TextStyle(fontSize: widget.mWidth * 0.03, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              lang.email,
                              style: TextStyle(fontSize: widget.mWidth * 0.02, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: widget.mHeight * 0.02,
              ),
              ListTile(
                horizontalTitleGap: widget.mWidth * 0.01,
                leading: Icon(Icons.dashboard, size: widget.mWidth * 0.035, color: Colors.black),
                title: Text(lang.dashboard,
                    style: TextStyle(
                      fontSize: widget.mWidth * 0.025,
                    )),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/dashboard');
                },
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                horizontalTitleGap: widget.mWidth * 0.01,
                leading: Icon(Icons.inbox, size: widget.mWidth * 0.035, color: Colors.black),
                title: Text(
                  lang.inbox,
                  style: TextStyle(
                    fontSize: widget.mWidth * 0.025,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/inbox2');
                },
              ),
              //Create a list tile for the sent
              Divider(
                thickness: 1,
              ),
              ListTile(
                horizontalTitleGap: widget.mWidth * 0.01,
                leading: Icon(Icons.send, size: widget.mWidth * 0.035, color: Colors.black),
                title: Text(
                  lang.sent,
                  style: TextStyle(
                    fontSize: widget.mWidth * 0.025,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/sent');
                },
              ),
              // Divider(
              //   thickness: 1,
              // ),
              // ListTile(
              //   horizontalTitleGap: widget.mWidth * 0.01,
              //   leading: Icon(Icons.view_cozy_outlined,
              //       size: widget.mWidth * 0.035, color: Colors.black),
              //   title: Text(
              //     lang.viewPdf,
              //     style: TextStyle(
              //       fontSize: widget.mWidth * 0.025,
              //     ),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pushReplacementNamed('/pdfkit');
              //   },
              // ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                horizontalTitleGap: widget.mWidth * 0.01,
                leading: Icon(Icons.language, size: widget.mWidth * 0.035, color: Colors.black),
                title: Text(lang.changeLang,
                    style: TextStyle(
                      fontSize: widget.mWidth * 0.025,
                    )),
                onTap: () {
                  Navigator.pushReplacementNamed(context, ModalRoute.of(context)!.settings.name!);
                  Provider.of<LanguageProvider>(context, listen: false).switchLanguage();
                },
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                horizontalTitleGap: widget.mWidth * 0.01,
                leading: Icon(Icons.exit_to_app, size: widget.mWidth * 0.035, color: Colors.black),
                title: Text(lang.logOut,
                    style: TextStyle(
                      fontSize: widget.mWidth * 0.025,
                    )),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ]),
          );
  }
}
