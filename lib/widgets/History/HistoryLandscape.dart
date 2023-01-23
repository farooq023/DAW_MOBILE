import 'package:daw_mobile/Providers/HistoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '../providers/languageProvider.dart';

class HistoryLandscape extends StatefulWidget {
  const HistoryLandscape({super.key});

  @override
  State<HistoryLandscape> createState() => _HistoryLandscapeState();
}

class _HistoryLandscapeState extends State<HistoryLandscape> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    var date = DateTime.now();
    var formattedDate = "${date.day}/${date.month}/${date.year}";
    final historyItems = Provider.of<HistoryPro>(context, listen: false);
    var lang = AppLocalizations.of(context)!;

    return Container(
      //add border radius to the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mWidth * 0.05),
        color: Theme.of(context).backgroundColor,
      ),
      height: mHeight * 0.9,
      child: Container(
        padding: EdgeInsets.all(mWidth * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.history,
                      size: mWidth * 0.03,
                      color: Theme.of(context).primaryColor),
                  onPressed: () {},
                ),
                Text(
                  // 'History',
                  lang.history,
                  style: TextStyle(
                      fontSize: mWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                IconButton(
                  icon: Icon(Icons.close,
                      size: mWidth * 0.03,
                      color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(
              height: mHeight * 0.025,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            SizedBox(
              height: mHeight * 0.01,
            ),
            Container(
              height: mHeight * 0.635,
              padding: EdgeInsets.only(top: mWidth * 0.02),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                ),
                itemCount: historyItems.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(mWidth * 0.020),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mWidth * 0.02),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    margin: EdgeInsets.only(
                        bottom: mWidth * 0.005, top: mWidth * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    //Create icon button for sendder and receiver
                                    Icon(
                                      Icons.person,
                                      size: mWidth * 0.025,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                      width: mWidth * 0.01,
                                    ),
                                    Text(
                                      '${historyItems.items[index].from}',
                                      style: TextStyle(
                                          fontSize: mWidth * 0.0175,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                //Create another row for receiver
                                Row(
                                  children: [
                                    //Create icon button for sendder and receiver
                                    Icon(
                                      Icons.person_pin,
                                      size: mWidth * 0.025,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                      width: mWidth * 0.01,
                                    ),
                                    Text(
                                      '${historyItems.items[index].to}',
                                      style: TextStyle(
                                          fontSize: mWidth * 0.0175,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    //Create icon button for subject
                                    Icon(
                                      Icons.subject,
                                      size: mWidth * 0.025,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: mWidth * 0.01),
                                    Text(
                                      '${historyItems.items[index].subject}',
                                      style: TextStyle(
                                          fontSize: mWidth * 0.0175,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    //Create icon button for subject
                                    Icon(
                                      Icons.date_range,
                                      size: mWidth * 0.025,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: mWidth * 0.01),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                          fontSize: mWidth * 0.0175,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
