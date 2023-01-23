import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/languageProvider.dart';

class WfDetailsLandscape extends StatelessWidget {
  // const WfDetailsLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = mSize.width;
    var cWidth = mWidth * 0.85;
    var modalHeight = mHeight * 0.92;
    var modalHeaderHeight = modalHeight * 0.13;
    var lang = AppLocalizations.of(context)!;

    var iconSize = mWidth * 0.04;
    var textSize = mWidth * 0.025;
    var innerPadding = mWidth * 0.025;
    var containerBorderRadius = mWidth * 0.03;

    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
      height: modalHeight,
      padding: EdgeInsets.all(mWidth * 0.02),
      // color: Theme.of(context).backgroundColor,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(40),
      //   ),
      //   color: Colors.red,
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: modalHeaderHeight,
              // decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).primaryColor,
                    size: iconSize,
                  ),
                  Text(
                    lang.workflowDetails,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.clear_outlined,
                      color: Theme.of(context).primaryColor,
                      size: iconSize,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            Container(
              // height: mHeight * 0.83,
              padding: EdgeInsets.only(left: mWidth * 0.02, right: mWidth * 0.02, top: mHeight * 0.02),
              // decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
              child: Column(
                children: [
                  //1st container
                  Container(
                    // color: Theme.of(context).primaryColorLight,
                    padding: EdgeInsets.all(innerPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Column(
                      children: [
                        Text(
                          lang.genInfo,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: textSize,
                          ),
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     width: 1,
                          //     color: Colors.red,
                          //   ),
                          // ),
                          margin: EdgeInsets.only(top: mHeight * 0.03),
                          width: mWidth * 0.85,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.reqNo,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     width: 1,
                                    //     color: Colors.red,
                                    //   ),
                                    // ),
                                    child: Text(
                                      "M150-452-452",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //2nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.subject,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     width: 1,
                                    //     color: Colors.red,
                                    //   ),
                                    // ),
                                    child: Text(
                                      lang.sampleSubject,
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //3nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.mainSite,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     width: 1,
                                    //     color: Colors.red,
                                    //   ),
                                    // ),
                                    child: Text(
                                      lang.moci,
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "...",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: textSize,
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
                  //2nd container
                  Container(
                    // color: Theme.of(context).primaryColorLight,
                    margin: EdgeInsets.only(top: mHeight * 0.02),
                    padding: EdgeInsets.all(innerPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Column(
                      children: [
                        Text(
                          lang.otherInfo,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: textSize,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: mHeight * 0.03),
                          width: mWidth * 0.85,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.totalAttach,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //2nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.linkedDox,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //3nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.totalSigns,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "...",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: textSize,
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
                  //3rd container
                  Container(
                    // color: Theme.of(context).primaryColorLight,
                    margin: EdgeInsets.only(top: mHeight * 0.02),
                    padding: EdgeInsets.all(innerPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Column(
                      children: [
                        Text(
                          lang.workitemInfo,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: textSize,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: mHeight * 0.03),
                          width: mWidth * 0.85,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.sender,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      LanguageProvider.isEng ? "Farooq" : "فاروق",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //2nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.senderDomain,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      "cms1",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              //3nd row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mWidth * 0.35,
                                    child: Text(
                                      lang.receivedOn,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mWidth * 0.4,
                                    child: Text(
                                      "10/1/2023",
                                      style: TextStyle(
                                        // color: Theme.of(context).primaryColor,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "...",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: textSize,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
