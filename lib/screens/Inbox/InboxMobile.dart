import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'dart:io';

import '../../models/Notifications.dart';
import '../../models/errorDialog.dart';

import '../../Providers/inboxPro.dart';
import '../../providers/languageProvider.dart';

import '../../widgets/mainDrawer.dart';
import '../../widgets/History/History.dart';
import '../../widgets/SearchWF/Search.dart';
import '../../widgets/WfDetails/WfDetails.dart';
import '../../widgets/ForwardWf/ForwardWf.dart';

class InboxMobile extends StatefulWidget {
  const InboxMobile({super.key});

  @override
  State<InboxMobile> createState() => _InboxMobileState();
}

class _InboxMobileState extends State<InboxMobile> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  void searchMail() {
    searchText = searchController.text;
  }

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  var scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;

    // final inboxItems = Provider.of<InboxPro>(context, listen: false);
    var inboxItems = Provider.of<InboxPro>(context, listen: false);
    var date = DateTime.now();
    var formattedDate = "${date.day}/${date.month}/${date.year}";
    var lang = AppLocalizations.of(context)!;
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

    return Scaffold(
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
                      contentPadding:
                          lang.localeName == 'en' ? EdgeInsets.symmetric(vertical: mHeight * 0.02) : EdgeInsets.symmetric(vertical: mHeight * 0.016),
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
