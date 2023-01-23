import 'package:daw_mobile/Models/errorDialog.dart';
import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'dart:io';

import '../models/Notifications.dart';
// import '../Models/errorDialog.dart';
import '../Providers/inboxPro.dart';
import '../widgets/mainDrawer.dart';
import '../widgets/History/History.dart';
import '../widgets/SearchWF/Search.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

// import 'package:motion_toast/motion_toast.dart';
import '../widgets/WfDetails/WfDetails.dart';
import '../widgets/ForwardWf/ForwardWf.dart';

class Inbox extends StatefulWidget {
  static const routeName = '/inbox';
  @override
  State<Inbox> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<Inbox> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  void searchMail() {
    searchText = searchController.text;
  }

  var scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;

    final inboxItems = Provider.of<InboxPro>(context, listen: false);
    // var inboxItems = Provider.of<InboxPro>(context, listen: false);
    var date = DateTime.now();
    var formattedDate = "${date.day}/${date.month}/${date.year}";
    final isLANDSCAPE = MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var lang = AppLocalizations.of(context)!;
    // var scaffoldKey = GlobalKey<ScaffoldState>();

    if (mWidth < 481) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    void SearchWF() {
      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(mWidth * 0.05),
            ),
          ),
          context: context,
          builder: (_) {
            return MySearch();
          });
    }

    //I want to show the history screen in a modal bottom sheet for different screen sizes
    void WFHistory() {
      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(mWidth * 0.05),
            ),
          ),
          context: context,
          builder: (_) {
            return MyHistory();
          });
    }

    void wfDetails() {
      showModalBottomSheet(
        // showDialog // showModalBottomSheet // showGeneralDialog
        // performInboxAction
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(mWidth * 0.05),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        context: context,
        builder: (_) {
          return WfDetails();
        },
      );
    }

    void forwardWf() {
      showModalBottomSheet(
        // showDialog // showModalBottomSheet // showGeneralDialog
        // performInboxAction
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(mWidth * 0.05),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        context: context,
        builder: (_) {
          return ForwardWf();
        },
      );
    }

    void showDocument() async {
      String docPath = 'assets/PDFs/Document.pdf';
      final bytes = await DefaultAssetBundle.of(context).load(docPath);
      final list = bytes.buffer.asUint8List();
      final tempDir = await Pspdfkit.getTemporaryDirectory();
      final tempDocumentPath = '${tempDir.path}/$docPath';
      final file = await File(tempDocumentPath).create(recursive: true);
      file.writeAsBytesSync(list);
      await Pspdfkit.present(tempDocumentPath, {});
    }

    return mWidth > 480
        ? isPortrait
            ? Scaffold(
                key: scaffoldKey,
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  leading: //if the language is arabic, change the drawer icon
                      lang.localeName == 'ar'
                          ? Container(
                              transform: Matrix4.translationValues(-mWidth * 0.02, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.045),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            )
                          : Container(
                              transform: Matrix4.translationValues(mWidth * 0.02, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.menu, size: mWidth * 0.045),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                  toolbarHeight: mHeight * 0.075,
                  title: Container(
                    //if language is arabic, change the title to the right
                    transform: lang.localeName == 'ar'
                        ? Matrix4.translationValues(-mWidth * 0.02, 0.0, 0.0) //move the icon to the right
                        : Matrix4.translationValues(mWidth * 0.02, 0.0, 0.0), //move the icon to the right
                    child: Text(
                      lang.inbox,
                      style: TextStyle(fontSize: mWidth * 0.045),
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
                    SizedBox(
                      width: mWidth * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        SearchWF();
                      },
                      child: Icon(
                        Icons.filter_alt_rounded,
                        size: mWidth * 0.07,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: mWidth * 0.04,
                    ),
                    //add user icon
                    Icon(
                      Icons.account_circle,
                      size: mWidth * 0.07,
                    ),
                    SizedBox(
                      width: mWidth * 0.04,
                    )
                  ],
                ),
                drawer: appDrawer(mWidth, mHeight),
                body: SingleChildScrollView(
                  child: Container(
                    //Create a search bar
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: mHeight * 0.02, left: mWidth * 0.04, right: mWidth * 0.04),
                          child: Container(
                            padding: EdgeInsets.only(left: mWidth * 0.02, right: mWidth * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(mWidth * 0.01),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: mWidth * 0.03),
                              decoration: InputDecoration(
                                hintText: lang.search,
                                hintStyle: TextStyle(fontSize: mWidth * 0.04, color: Colors.grey[400]),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search, size: mWidth * 0.04),
                                contentPadding: lang.localeName == 'en'
                                    ? EdgeInsets.symmetric(vertical: mHeight * 0.02)
                                    : EdgeInsets.symmetric(vertical: mHeight * 0.0135),
                                suffixIcon: searchController.text != ''
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          searchController.clear();
                                        },
                                      )
                                    : null,
                              ),
                              controller: searchController,
                            ),
                          ),
                        ),
                        //This is for the card
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(width: 1, color: Colors.red)),
                          padding: EdgeInsets.only(
                            bottom: mHeight * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            top: mHeight * 0.02,
                            left: mWidth * 0.035,
                            right: mWidth * 0.035,
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: inboxItems.items.length,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(
                                bottom: mHeight * 0.005,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDocument();
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
                                        ),
                                        height: mHeight * 0.13,
                                        child: Row(
                                          children: [
                                            //This one is used for the picture
                                            Container(
                                              margin: EdgeInsets.only(
                                                right: mWidth * 0.01,
                                                left: mWidth * 0.02,
                                              ),
                                              width: mWidth * 0.2,
                                              height: mHeight * 0.1,
                                              child: Image.asset('assets/images/profile.png'),
                                            ),
                                            //This container is used for the body
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: mWidth * 0.01,
                                              ),
                                              width: mWidth * 0.4,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(inboxItems.items[index].user, style: TextStyle(fontSize: mWidth * 0.04)),
                                                  Text(inboxItems.items[index].title, style: TextStyle(fontSize: mWidth * 0.03)),
                                                  Text(inboxItems.items[index].reqN, style: TextStyle(fontSize: mWidth * 0.03)),
                                                ],
                                              ),
                                            ),
                                            //This container is used for the date and expand button
                                            Container(
                                              width: mWidth * 0.26,
                                              height: mHeight * 0.15,
                                              margin: EdgeInsets.only(
                                                left: mWidth * 0.01,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    formattedDate,
                                                    style: TextStyle(
                                                      fontSize: mWidth * 0.03,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: IconButton(
                                                      icon: Icon(
                                                          color: Theme.of(context).primaryColor,
                                                          size: mWidth * 0.04,
                                                          inboxItems.items[index].expanded ? Icons.expand_less : Icons.expand_more),
                                                      onPressed: () {
                                                        setState(() {
                                                          inboxItems.items[index].expanded = !inboxItems.items[index].expanded;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (inboxItems.items[index].expanded)
                                        Container(
                                          width: double.infinity,
                                          height: mHeight * 0.05,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(mWidth * 0.0075),
                                              bottomRight: Radius.circular(mWidth * 0.0075),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: wfDetails,
                                                  child: Icon(
                                                    Icons.featured_play_list_outlined,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: WFHistory,
                                                  child: Icon(
                                                    Icons.history,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: forwardWf,
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.forward,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialoge(context, mHeight, mWidth);
                                                },
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.archive,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  MotionToast.success(
                                                    iconSize: mWidth * 0.07,
                                                    width: mWidth * 0.7,
                                                    height: mHeight * 0.1,
                                                    animationType: AnimationType.fromTop,
                                                    description: Text(
                                                      LanguageProvider.isEng
                                                          ? "The task has been completed successfully."
                                                          : "تم الانتهاء من المهمة بنجاح.",
                                                      style: TextStyle(
                                                        fontSize: mWidth * 0.03,
                                                      ),
                                                    ),
                                                    position: MotionToastPosition.top,
                                                  ).show(context);
                                                },
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.thumb_up,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialoge1(context, mHeight, mWidth);
                                                },
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.notes,
                                                    size: mWidth * 0.045,
                                                    color: Colors.white,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            //===============================================Tablet, landscape mode===============================================
            : Scaffold(
                key: scaffoldKey,
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  leading: //if the language is arabic, change the drawer icon
                      lang.localeName == 'ar'
                          ? Container(
                              transform: Matrix4.translationValues(-mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
                                icon: Icon(Icons.menu, size: mWidth * 0.0275),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            )
                          : Container(
                              transform: Matrix4.translationValues(mWidth * 0.015, 0.0, 0.0), //move the icon to the right
                              child: IconButton(
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
                        : Matrix4.translationValues(mWidth * 0.01, 0.0, 0.0), //move the icon to the right
                    child: Text(
                      lang.inbox,
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
                    SizedBox(
                      width: mWidth * 0.005,
                    ),
                    GestureDetector(
                      onTap: () {
                        SearchWF();
                      },
                      child: Icon(
                        Icons.filter_alt_rounded,
                        size: mWidth * 0.06,
                      ),
                    ),
                    SizedBox(width: mWidth * 0.03),
                    //add user icon
                    Icon(
                      Icons.account_circle,
                      size: mWidth * 0.06,
                    ),
                    SizedBox(
                      width: mWidth * 0.06,
                    )
                  ],
                ),
                drawer: appDrawer(mWidth, mHeight),
                body: SingleChildScrollView(
                  child: Container(
                    //Create a search bar
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: mHeight * 0.04, left: mWidth * 0.04, right: mWidth * 0.04),
                          child: Container(
                            padding: EdgeInsets.only(left: mWidth * 0.02, right: mWidth * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(mWidth * 0.01),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: searchController,
                              style: TextStyle(fontSize: mWidth * 0.025),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: lang.search,
                                prefixIcon: Icon(Icons.search, size: mWidth * 0.025),
                                contentPadding: lang.localeName == 'en'
                                    ? EdgeInsets.symmetric(vertical: mHeight * 0.035)
                                    : EdgeInsets.symmetric(vertical: mHeight * 0.0275),
                                suffixIcon: searchController.text != ''
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          searchController.clear();
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        //This is for the card
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(width: 1, color: Colors.red)),
                          padding: EdgeInsets.only(
                            bottom: mHeight * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            top: mHeight * 0.03,
                            left: mWidth * 0.035,
                            right: mWidth * 0.035,
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: inboxItems.items.length,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(
                                bottom: mHeight * 0.01,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDocument();
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(mWidth * 0.00),
                                          ),
                                          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
                                        ),
                                        height: mHeight * 0.225,
                                        child: Row(
                                          children: [
                                            //This one is used for the picture
                                            Container(
                                              margin: EdgeInsets.only(
                                                right: mWidth * 0.01,
                                                left: mWidth * 0.02,
                                              ),
                                              width: mWidth * 0.2,
                                              height: mHeight * 0.175,
                                              child: Image.asset('assets/images/profile.png'),
                                            ),
                                            //This container is used for the body
                                            Container(
                                              padding: EdgeInsets.only(top: mHeight * 0.01),
                                              width: mWidth * 0.3,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(inboxItems.items[index].user, style: TextStyle(fontSize: mWidth * 0.0275)),
                                                  Text(inboxItems.items[index].title, style: TextStyle(fontSize: mWidth * 0.02)),
                                                  Text(inboxItems.items[index].reqN, style: TextStyle(fontSize: mWidth * 0.0175)),
                                                ],
                                              ),
                                            ),
                                            //This container is used for the date and expand button
                                            Container(
                                              alignment: Alignment.center,
                                              // decoration: BoxDecoration(
                                              //   color: Theme.of(context)
                                              //       .primaryColor,
                                              //   //Create border raduis for only the bottom
                                              // ),
                                              width: mWidth * 0.2,
                                              height: mHeight * 0.2,
                                              child: Text(
                                                formattedDate,
                                                style: TextStyle(
                                                  fontSize: mWidth * 0.02,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: mWidth * 0.19,
                                              child: Center(
                                                child: IconButton(
                                                  icon: Icon(
                                                      color: Theme.of(context).primaryColor,
                                                      size: mWidth * 0.03,
                                                      inboxItems.items[index].expanded ? Icons.expand_less : Icons.expand_more),
                                                  onPressed: () {
                                                    setState(() {
                                                      inboxItems.items[index].expanded = !inboxItems.items[index].expanded;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (inboxItems.items[index].expanded)
                                        Container(
                                          width: double.infinity,
                                          height: mHeight * 0.09,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            //Create border raduis for only the bottom
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(mWidth * 0.005),
                                              bottomRight: Radius.circular(mWidth * 0.005),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: wfDetails,
                                                  child: Icon(
                                                    Icons.featured_play_list_outlined,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: WFHistory,
                                                  child: Icon(
                                                    Icons.history,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: forwardWf,
                                                  child: Icon(
                                                    Icons.forward,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: mWidth * 0.15,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showDialoge(context, mHeight, mWidth);
                                                  },
                                                  child: Icon(
                                                    Icons.archive,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  MotionToast.success(
                                                    iconSize: mWidth * 0.05,
                                                    width: mWidth * 0.6,
                                                    height: mHeight * 0.2,
                                                    animationType: AnimationType.fromTop,
                                                    description: Text(
                                                      LanguageProvider.isEng
                                                          ? "The task has been completed successfully."
                                                          : "تم الانتهاء من المهمة بنجاح.",
                                                      style: TextStyle(
                                                        fontSize: mWidth * 0.02,
                                                      ),
                                                    ),
                                                    position: MotionToastPosition.top,
                                                  ).show(context);
                                                },
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.thumb_up,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => showDialoge1(context, mHeight, mWidth),
                                                child: Container(
                                                  width: mWidth * 0.15,
                                                  child: Icon(
                                                    Icons.notes,
                                                    size: mWidth * 0.03,
                                                    color: Colors.white,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
        //============================================This is for mobile view============================================//
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              toolbarHeight: mHeight * 0.075,
              title: Text(
                lang.inbox,
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
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_rounded,
                    size: mWidth * 0.09,
                  ),
                  onPressed: () {
                    SearchWF();
                  },
                ),
                SizedBox(
                  width: mWidth * 0.02,
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
            drawer: appDrawer(mWidth, mHeight),
            body: SingleChildScrollView(
              child: Container(
                //Create a search bar
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: mHeight * 0.02, left: mWidth * 0.04, right: mWidth * 0.04),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(mWidth * 0.01),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: lang.search,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            contentPadding: lang.localeName == 'en'
                                ? EdgeInsets.symmetric(vertical: mHeight * 0.02)
                                : EdgeInsets.symmetric(vertical: mHeight * 0.016),
                            suffixIcon: searchController.text != ''
                                ? IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      searchController.clear();
                                    },
                                  )
                                : null,
                          ),
                          controller: searchController,
                        ),
                      ),
                    ),
                    //This is for the card
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 1, color: Colors.red)),
                      margin: EdgeInsets.only(
                        top: mHeight * 0.02,
                        left: mWidth * 0.03,
                        right: mWidth * 0.03,
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: inboxItems.items.length,
                        itemBuilder: (context, index) => Card(
                          child: Column(
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  // if you need this
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                ),
                                onTap: showDocument,
                                title: Container(
                                  margin: EdgeInsets.only(
                                    top: mHeight * 0.01,
                                  ),
                                  child: Text(inboxItems.items[index].user, style: TextStyle(fontSize: mWidth * 0.05)),
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(
                                    bottom: mHeight * 0.01,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(inboxItems.items[index].title, style: TextStyle(fontSize: mWidth * 0.04)),
                                      Text(inboxItems.items[index].reqN),
                                    ],
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: mWidth * 0.08,
                                  backgroundColor: Colors.transparent,
                                  //Get image from the internet
                                  backgroundImage: Image.asset(
                                    'assets/images/profile.png',
                                  ).image,
                                ),
                                trailing: Container(
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(
                                  //   width: 0.8,
                                  //   color: Colors.red,
                                  // )),
                                  // height: mHeight * 0.085,
                                  child: FittedBox(
                                    child: Column(
                                      children: [
                                        Text(formattedDate,
                                            style: TextStyle(
                                              fontSize: mWidth * 0.045,
                                            )),
                                        //Create expandable button
                                        // Container(
                                        // child:
                                        Container(
                                          transform: Matrix4.translationValues(0.0, mHeight * 0.015, 0.0),
                                          child: IconButton(
                                            icon: Icon(
                                                color: Theme.of(context).primaryColor,
                                                size: mWidth * 0.08,
                                                inboxItems.items[index].expanded ? Icons.expand_less : Icons.expand_more),
                                            onPressed: () {
                                              setState(() {
                                                inboxItems.items[index].expanded = !inboxItems.items[index].expanded;
                                                // if (inboxItems.items[index].expanded) {
                                                //   inboxItems.items[index].height =
                                                //       mHeight * 0.2;
                                                // } else {
                                                //   inboxItems.items[index].height =
                                                //       mHeight * 0.1;
                                                // }
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Create the expandable part
                              if (inboxItems.items[index].expanded)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(mWidth * 0.0075),
                                      bottomRight: Radius.circular(mWidth * 0.0075),
                                    ),
                                  ),
                                  height: mHeight * 0.05,
                                  //add three buttons in a row
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: mWidth * 0.15,
                                        child: GestureDetector(
                                          onTap: wfDetails,
                                          child: Icon(
                                            Icons.featured_play_list_outlined,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mWidth * 0.15,
                                        child: GestureDetector(
                                          onTap: WFHistory,
                                          child: Icon(
                                            Icons.history,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mWidth * 0.15,
                                        child: GestureDetector(
                                          onTap: forwardWf,
                                          child: Icon(
                                            Icons.forward,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialoge(context, mHeight, mWidth);
                                        },
                                        child: Container(
                                          width: mWidth * 0.15,
                                          child: Icon(
                                            Icons.archive,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          MotionToast.success(
                                            animationType: AnimationType.fromTop,
                                            description: Center(
                                              child: Text(
                                                LanguageProvider.isEng ? "The task has been completed successfully." : "تم الانتهاء من المهمة بنجاح.",
                                              ),
                                            ),
                                            position: MotionToastPosition.top,
                                          ).show(context);
                                        },
                                        child: Container(
                                          width: mWidth * 0.15,
                                          child: Icon(
                                            Icons.thumb_up,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialoge1(context, mHeight, mWidth);
                                        },
                                        child: Container(
                                          width: mWidth * 0.15,
                                          child: Icon(
                                            Icons.notes,
                                            size: mWidth * 0.05,
                                            color: Colors.white,
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
                  ],
                ),
              ),
            ),
          );
  }
}
