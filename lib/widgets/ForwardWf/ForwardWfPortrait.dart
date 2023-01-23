import 'package:daw_mobile/widgets/incompleteEntriesTablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';

import '../../providers/languageProvider.dart';
import '../wfSubjectTablet.dart';
import '../executeBtnTablet.dart';
import '../pickFileBtn.dart';
import '../incompleteEntries.dart';

class ForwardWfPortrait extends StatefulWidget {
  @override
  State<ForwardWfPortrait> createState() => _ForwardWfPortraitState();
}

class _ForwardWfPortraitState extends State<ForwardWfPortrait> {
  TextEditingController subjectCtrl = TextEditingController(text: LanguageProvider.isEng ? "Sample Subject" : "موضوع العينة");
  TextEditingController priorityCtrl = TextEditingController(text: LanguageProvider.isEng ? "Urgent" : "العاجلة");
  TextEditingController actionController = TextEditingController();
  TextEditingController dateCtrl = TextEditingController(text: "02-02-2023");
  TextEditingController recipientController = TextEditingController();

  List attachments = [];
  List<String> recipients = [];
  List<Map> files = [];
  bool forwarding = false;
  List<String> incompleteEntries = [];
  List<String> actions = LanguageProvider.isEng
      ? [
          "For Save",
          "For Info",
          "For Preparing",
          "For Later Use",
          "Sample Action1",
          "Sample Action2",
        ]
      : [
          "للحفظ",
          "للمعلومات",
          "للتحضير",
          "للاستخدام اللاحق",
          "نموذج الإجراء 1",
          "نموذج الإجراء 2",
        ];

  List<String> rcvdRcpnts = LanguageProvider.isEng
      ? [
          "Farooq",
          "Ahmad",
          "Ali",
          "Mustafa",
          "Aziz",
          "Hassan",
        ]
      : [
          "فاروق",
          "أحمد",
          "علي",
          "مصطفى",
          "عزيز",
          "حسان",
        ];

  void addRecipient() {
    setState(() {
      rcvdRcpnts.remove(recipientController.text);
      recipients.add(recipientController.text);
      recipientController.clear();
    });
  }

  void removeRecipient(int index) {
    setState(() {
      rcvdRcpnts.add(recipients[index]);
      recipients.removeAt(index);
    });
  }

  void viewFile(int index) {
    if (files[index]["deletable"]) OpenFile.open(files[index]["FileURL"]);
    // else {}
  }

  void removeFile(int index) {
    setState(() {
      files.removeAt(index);
    });
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;

    for (int i = 0; i < files.length; i++) {
      if (result.files.first.path == files[i]["FileURL"]) {
        return;
      }
    }

    setState(() {
      files.add({
        "FileName": result.files.first.name,
        "FileURL": result.files.first.path,
        "deletable": true,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = mSize.width;
    var cWidth = mWidth * 0.4;
    var modalHeight = mHeight * 0.95;
    var modalHeaderHeight = modalHeight * 0.08;
    var modalBodyHeight = mHeight * 0.81;
    var lang = AppLocalizations.of(context)!;

    var marginTop = mHeight * 0.02;

    var labelSize = mWidth * 0.04;
    var textSize = mWidth * 0.03;

    var iconSize = mWidth * 0.05;
    var iconSize2 = mWidth * 0.0425;
    var innerPadding = mWidth * 0.03;
    var containerBorderRadius = mWidth * 0.03;
    var boxHeight = mHeight * 0.29;

    showAlertDialog() {
      return showDialog<void>(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return IncompleteEntriesTablet(mHeight * 0.1, mHeight * 0.4, textSize, incompleteEntries, iconSize);
        },
      );
    }

    void forward() async {
      setState(() {
        forwarding = true;
      });
      incompleteEntries.clear();
      if (!actions.contains(actionController.text)) {
        incompleteEntries.add(LanguageProvider.isEng ? "- Invalid Action!" : "- عمل غير صالح!");
      }
      if (recipients.isEmpty) {
        incompleteEntries.add(LanguageProvider.isEng ? "- Add at least one recipient." : "- أضف مستلم واحد على الأقل.");
      }
      // if (files.isEmpty) {
      //   incompleteEntries.add(LanguageProvider.isEng ? "- Attach at least one file." : "- إرفاق ملف واحد على الأقل.");
      // }

      if (incompleteEntries.isNotEmpty) {
        setState(() {
          forwarding = false;
        });
        showAlertDialog();
      }
      // await 3000;
      // setState(() {
      //   forwarding = false;
      // });
      else {
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          forwarding = false;
        });
        Navigator.pushReplacementNamed(context, "/inbox");
      }
    }

    return Container(
      height: modalHeight,
      padding: EdgeInsets.all(mWidth * 0.03),
      child: Column(
        children: [
          Container(
            height: modalHeaderHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.forward,
                  color: Theme.of(context).primaryColor,
                  size: iconSize,
                ),
                Text(
                  lang.forwardWf,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: labelSize,
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
            height: modalBodyHeight,
            width: double.infinity,
            padding: EdgeInsets.only(left: mWidth * 0.02, right: mWidth * 0.02, top: mHeight * 0.02),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: Colors.red,
            //   ),
            // ),
            child: Column(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WfSubjectTablet(cWidth, textSize, labelSize, subjectCtrl, false),
                      Container(
                        width: cWidth,
                        child: TextField(
                          style: TextStyle(fontSize: textSize),
                          enabled: false,
                          controller: priorityCtrl,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: lang.priority,
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: labelSize,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ],
                  ),
                ),
                //2nd Container
                Container(
                  margin: EdgeInsets.only(top: marginTop),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: cWidth,
                        child: TextFieldSearch(
                          itemsInView: 4,
                          controller: actionController,
                          initialList: actions,
                          label: '',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).backgroundColor,
                            hintText: LanguageProvider.isEng ? 'Type to search actions...' : 'اكتب إجراءات البحث ...',
                            labelText: AppLocalizations.of(context)!.action,
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: labelSize,
                            ),
                            // border: CustomBorderTextFieldSkin().getSkin(),
                            suffixIcon: actionController.text != ''
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        actionController.clear();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        width: cWidth,
                        child: TextField(
                          style: TextStyle(fontSize: textSize),
                          enabled: false,
                          controller: dateCtrl,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.endingDate,
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: labelSize,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ],
                  ),
                ),
                // 3rd Container
                Container(
                  margin: EdgeInsets.only(top: marginTop),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: cWidth,
                        height: boxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(mWidth * 0.01),
                        child: Column(
                          children: [
                            Container(
                              // width: mWidth * 0.75,
                              // decoration: BoxDecoration(
                              //     border: Border.all(
                              //   width: 1,
                              //   color: Colors.red,
                              // )),
                              child: TextFieldSearch(
                                itemsInView: 4,
                                controller: recipientController,
                                initialList: rcvdRcpnts,
                                label: '',
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(context).backgroundColor,
                                  // labelText: AppLocalizations.of(context)!.action,
                                  labelText: LanguageProvider.isEng ? "Recipient" : "متلقي",
                                  hintText: LanguageProvider.isEng ? "Type to search recipients..." : "اكتب للبحث عن المستلمين ...",
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: textSize,
                                  ),
                                  // border: CustomBorderTextFieldSkin().getSkin(),
                                  suffixIcon: recipientController.text != ''
                                      ? IconButton(
                                          icon: Icon(
                                            rcvdRcpnts.contains(recipientController.text) ? Icons.check_circle_outline : Icons.clear_outlined,
                                            color: rcvdRcpnts.contains(recipientController.text) ? Colors.green : Theme.of(context).primaryColor,
                                            size: iconSize2,
                                            // color: Colors.green,
                                          ),
                                          onPressed: rcvdRcpnts.contains(recipientController.text)
                                              ? addRecipient
                                              : () {
                                                  setState(() {
                                                    recipientController.clear();
                                                  });
                                                },
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            Container(
                              height: mHeight * 0.19,
                              margin: EdgeInsets.only(top: mHeight * 0.01),
                              // decoration: BoxDecoration(
                              //     border: Border.all(
                              //   width: 1,
                              //   color: Colors.red,
                              // )),
                              child: recipients.length == 0
                                  ? ListTile(
                                      leading: Icon(
                                        // Icons.account_circle,
                                        Icons.no_accounts_rounded,
                                        color: Theme.of(context).primaryColor,
                                        size: iconSize2,
                                      ),
                                      title: Text(
                                        LanguageProvider.isEng ? 'No recipient selected' : 'لم يتم تحديد مستلم',
                                        style: TextStyle(
                                          fontSize: textSize,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: recipients.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Icon(
                                            Icons.account_circle,
                                            color: Theme.of(context).primaryColor,
                                            size: iconSize2,
                                          ),
                                          title: Text(
                                            recipients[index],
                                            style: TextStyle(
                                              fontSize: textSize,
                                            ),
                                          ),
                                          trailing: Container(
                                            // width: mWidth * 0.18,
                                            child: FittedBox(
                                              child: Row(
                                                children: [
                                                  // IconButton(
                                                  //   onPressed: () => showUserDialog(index),
                                                  //   icon: const Icon(Icons.drive_file_rename_outline),
                                                  //   color: Theme.of(context).primaryColor,
                                                  // ),
                                                  IconButton(
                                                    onPressed: () => removeRecipient(index),
                                                    icon: const Icon(Icons.clear_outlined),
                                                    color: Theme.of(context).primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: boxHeight,
                        width: cWidth,
                        // margin: EdgeInsets.only(bottom: marginBottom),
                        padding: EdgeInsets.all(mWidth * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              // height: mHeight * 0.2,
                              child: files.length == 0
                                  ? ListTile(
                                      leading: Icon(
                                        // Icons.account_circle,
                                        Icons.insert_page_break,
                                        color: Theme.of(context).primaryColor,
                                        size: iconSize2,
                                      ),
                                      title: Text(
                                        LanguageProvider.isEng ? 'No attachment' : 'لا يوجد مرفق',
                                        style: TextStyle(fontSize: textSize),
                                      ),
                                      // trailing: Icon(
                                      //   Icons.clear,
                                      //   color: Theme.of(context).primaryColor,
                                      // ),
                                    )
                                  : ListView.builder(
                                      itemCount: files.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Icon(
                                            Icons.insert_drive_file,
                                            color: Theme.of(context).primaryColor,
                                            size: iconSize2,
                                          ),
                                          title: Text(
                                            files[index]["FileName"],
                                          ),
                                          trailing: Container(
                                            width: mWidth * 0.18,
                                            // decoration: BoxDecoration(
                                            //   border: Border.all(
                                            //     color: Theme.of(context)
                                            //         .primaryColor,
                                            //     width: 1,
                                            //   ),
                                            // ),
                                            child: FittedBox(
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.remove_red_eye_outlined,
                                                      size: iconSize2,
                                                    ),
                                                    color: Theme.of(context).primaryColor,
                                                    onPressed: () {
                                                      viewFile(index);
                                                      // print("view file");
                                                    },
                                                  ),
                                                  files[index]["deletable"]
                                                      ? IconButton(
                                                          icon: Icon(
                                                            Icons.delete_outline,
                                                            size: iconSize2,
                                                          ),
                                                          color: Colors.red,
                                                          onPressed: () => removeFile(index),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: PickFileBtn(pickFile),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: marginTop * 1.2),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //   width: 1,
                  //   color: Colors.red,
                  // )),
                  child: ExecuteBtnTablet(
                    mHeight * 0.06,
                    cWidth,
                    forward,
                    forwarding,
                    labelSize,
                    LanguageProvider.isEng ? "Forward" : "إلى الأمام",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
