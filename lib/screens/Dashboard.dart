import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/Items.dart';
import '../models/Notifications.dart';
import '../models/errorDialog.dart';

import '../providers/Dashboardpro.dart';

import '../providers/languageProvider.dart';
import '../widgets/DashboardItem.dart';
import '../widgets/mainDrawer.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;

    if (mWidth < 481) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    var dashData = Provider.of<DashboardPro>(context, listen: false);
    // var dashItems = dashData.items;
    var dashItems = LanguageProvider.isEng
        ? [
            Items(
              id: '1',
              title: 'New',
              color: Color.fromARGB(255, 237, 140, 242),
              icon: Icons.mail,
              number: 0,
            ),
            Items(
              id: '2',
              title: 'Waiting to Complete',
              color: Color.fromARGB(255, 112, 185, 30),
              icon: Icons.mark_as_unread,
              number: 5,
            ),
            Items(
              id: '3',
              title: 'Returned',
              color: Color.fromARGB(255, 227, 216, 122),
              icon: Icons.rotate_left_rounded,
              number: 2,
            ),
            Items(
              id: '4',
              title: 'Waiting to Proceed',
              color: Colors.grey,
              icon: Icons.wifi_protected_setup_sharp,
              number: 0,
            ),
            Items(
              id: '5',
              title: 'Outgoing',
              color: Color.fromARGB(255, 154, 20, 20),
              icon: Icons.mail_outline,
              number: 1,
            ),
            Items(
              id: '6',
              title: 'Signing',
              color: Color.fromARGB(179, 255, 78, 196),
              //Signature icon
              icon: Icons.app_registration,
              number: 9,
            ),
          ]
        : [
            Items(
              id: '1',
              title: 'جديد',
              color: Color.fromARGB(255, 237, 140, 242),
              icon: Icons.mail,
              number: 0,
            ),
            Items(
              id: '2',
              title: 'بإنتظار الإجراء',
              color: Color.fromARGB(255, 112, 185, 30),
              icon: Icons.mark_as_unread,
              number: 5,
            ),
            Items(
              id: '3',
              title: 'معاد',
              color: Color.fromARGB(255, 227, 216, 122),
              icon: Icons.rotate_left_rounded,
              number: 2,
            ),
            Items(
              id: '4',
              title: 'بإنتظار الإتمام',
              color: Colors.grey,
              icon: Icons.wifi_protected_setup_sharp,
              number: 0,
            ),
            Items(
              id: '5',
              title: 'الصادر الخارجي',
              color: Color.fromARGB(255, 154, 20, 20),
              icon: Icons.mail_outline,
              number: 1,
            ),
            Items(
              id: '6',
              title: 'التوقيع',
              color: Color.fromARGB(179, 255, 78, 196),
              //Signature icon
              icon: Icons.app_registration,
              number: 9,
            ),
          ];
    ;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final isLANDSCAPE = MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var lang = AppLocalizations.of(context)!;

    return mWidth > 480
        //===========================TABLET PORTRAIT===========================
        ? isPortrait
            ? Scaffold(
                key: scaffoldKey,
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  leading: //if the language is arabic, change the drawer icon
                      lang.localeName == 'ar'
                          ? Container(
                              transform: Matrix4.translationValues(-mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.045),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            )
                          : Container(
                              transform: Matrix4.translationValues(mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.045),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                  toolbarHeight: mHeight * 0.075,
                  title: Text(
                    // lang.notifications,
                    lang.dashboard,
                    style: TextStyle(fontSize: mWidth * 0.0475),
                  ),
                  //add notification icon with counter
                  actions: [
                    NamedIcon(
                      // text: lang.notifications,
                      text: lang.notifications,
                      iconData: Icons.notifications,
                      notificationCount: 0,
                      onTap: () {
                        showErrorDialog1(lang.notifications, lang.noNotifications, context, mWidth, mHeight);
                      },
                      mHeight: mHeight,
                      mWidth: mWidth,
                    ),
                    SizedBox(
                      width: mWidth * 0.035,
                      // width: mWidth * 0.04,
                    ),
                    //add user icon
                    Icon(Icons.account_circle, size: mWidth * 0.07),
                    SizedBox(
                      width: mWidth * 0.045,
                    )
                  ],
                ),
                //change the drawer icon size
                drawer: appDrawer(mWidth, mHeight),
                body: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: mWidth * 0.03, horizontal: mWidth * 0.02),
                  itemCount: dashItems.length,
                  itemBuilder: (context, index) {
                    return DashboardItem(
                      id: dashItems[index].id,
                      title: dashItems[index].title,
                      color: dashItems[index].color,
                      icon: dashItems[index].icon,
                      number: dashItems[index].number,
                      mHeight: mHeight,
                      mWidth: mWidth,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: mHeight * 0.15,
                  ),
                ),
                //===============================for tablet, landscape mode===============================
              )
            : Scaffold(
                key: scaffoldKey,
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  leading: //if the language is arabic, change the drawer icon
                      lang.localeName == 'ar'
                          ? Container(
                              transform: Matrix4.translationValues(-mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.0275),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            )
                          : Container(
                              transform: Matrix4.translationValues(mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.0275),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                  toolbarHeight: mHeight * 0.14,
                  title: Container(
                    transform: lang.localeName == 'ar'
                        ? Matrix4.translationValues(-mWidth * 0.01, 0.0, 0.0) //move the icon to the right
                        : Matrix4.translationValues(mWidth * 0.01, 0.0, 0.0),
                    child: Text(
                      lang.dashboard,
                      style: TextStyle(fontSize: mWidth * 0.03),
                    ),
                  ),
                  //add notification icon with counter
                  actions: [
                    NamedIcon(
                      text: lang.notifications,
                      iconData: Icons.notifications,
                      notificationCount: 0,
                      onTap: () {
                        showErrorDialog1(lang.notifications, lang.noNotifications, context, mWidth, mHeight);
                      },
                      mHeight: mHeight,
                      mWidth: mWidth,
                    ),
                    // SizedBox(
                    //   width: mWidth * 0.035,
                    // ),
                    //add user icon
                    Container(
                        child: Icon(
                      Icons.account_circle,
                      size: mWidth * 0.055,
                    )),
                    SizedBox(
                      width: mWidth * 0.02,
                    )
                  ],
                ),
                //change the drawer icon size
                drawer: appDrawer(mWidth, mHeight),
                body: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: dashItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: DashboardItem(
                        id: dashItems[index].id,
                        title: dashItems[index].title,
                        color: dashItems[index].color,
                        icon: dashItems[index].icon,
                        number: dashItems[index].number,
                        mHeight: mHeight,
                        mWidth: mWidth,
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: mHeight * 0.3,
                  ),
                ),
                //===============================for mobile===============================
              )
        : Scaffold(
            key: scaffoldKey,
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              toolbarHeight: mHeight * 0.075,
              title: Text(
                lang.dashboard,
                style: TextStyle(fontSize: mWidth * 0.06),
              ),
              //add notification icon with counter
              actions: [
                NamedIcon(
                  text: lang.notifications,
                  iconData: Icons.notifications,
                  notificationCount: 0,
                  onTap: () {
                    showErrorDialog1(lang.notifications, lang.noNotifications, context, mWidth, mHeight);
                  },
                  mHeight: mHeight,
                  mWidth: mWidth,
                ),
                SizedBox(
                  width: mWidth * 0.0,
                ),
                //add user icon
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    size: mWidth * 0.09,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: mWidth * 0.02,
                ),
              ],
            ),
            //change the drawer icon size
            drawer: appDrawer(mWidth, mHeight),
            body: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: dashItems.length,
              itemBuilder: (context, index) {
                return DashboardItem(
                  id: dashItems[index].id,
                  title: dashItems[index].title,
                  color: dashItems[index].color,
                  icon: dashItems[index].icon,
                  number: dashItems[index].number,
                  mHeight: mHeight,
                  mWidth: mWidth,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3 / 1,
                // crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: mHeight * 0.18,
              ),
            ),
          );
  }
}
