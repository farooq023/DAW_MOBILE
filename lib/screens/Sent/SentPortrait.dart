import 'package:flutter/material.dart';
import 'package:daw_mobile/Models/errorDialog.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:daw_mobile/Models/Notifications.dart';
import 'package:daw_mobile/Models/errorDialog.dart';
import 'package:daw_mobile/Providers/inboxPro.dart';
import 'package:daw_mobile/widgets/mainDrawer.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:daw_mobile/widgets/History/History.dart';

class SentPort extends StatefulWidget {
  @override
  State<SentPort> createState() => _SentPortState();
}

class _SentPortState extends State<SentPort> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    final inboxItems = Provider.of<InboxPro>(context, listen: false);
    var date = DateTime.now();
    var formattedDate = "${date.day}/${date.month}/${date.year}";
    final scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();
    var lang = AppLocalizations.of(context)!;
    String searchText = '';

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

    void searchMail() {
      searchText = searchController.text;
    }

    return Scaffold(
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
            lang.sent,
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
            width: mWidth * 0.04,
          ),
          //add user icon
          Icon(
            Icons.account_circle,
            size: mWidth * 0.07,
          ),
          SizedBox(
            width: mWidth * 0.05,
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
                    onChanged: (value) {
                      setState(() {
                        searchText = value.toLowerCase();
                        searchMail();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: lang.search,
                      hintStyle: TextStyle(fontSize: mWidth * 0.04, color: Colors.grey[400]),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, size: mWidth * 0.04),
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
                                  GestureDetector(
                                    onTap: () {
                                      WFHistory();
                                    },
                                    child: Container(
                                      width: mWidth * 0.175,
                                      child: Icon(
                                        Icons.history,
                                        size: mWidth * 0.045,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.175,
                                    child: Icon(
                                      Icons.cancel,
                                      size: mWidth * 0.045,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.175,
                                    child: Icon(
                                      Icons.delete,
                                      size: mWidth * 0.045,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.175,
                                    child: Icon(
                                      Icons.notifications,
                                      size: mWidth * 0.045,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.175,
                                    child: Icon(Icons.send, size: mWidth * 0.045, color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
