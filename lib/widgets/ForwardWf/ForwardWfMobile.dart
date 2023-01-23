import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';

import '../../providers/languageProvider.dart';
import '../wfSubject.dart';
import '../executeBtn.dart';
import '../pickFileBtn.dart';
import '../incompleteEntries.dart';
// import '../.dart';

class ForwardWfMobile extends StatefulWidget {
  @override
  State<ForwardWfMobile> createState() => _ForwardWfMobileState();
}

class _ForwardWfMobileState extends State<ForwardWfMobile> {
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var mSize = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = mSize.width;
    var cWidth = mWidth * 0.82;
    var modalHeight = mHeight * 0.95;
    var modalHeaderHeight = modalHeight * 0.08;
    var modalBodyHeight = mHeight * 0.81;
    var containerBorderRadius = mWidth * 0.03;
    var lang = AppLocalizations.of(context)!;

    double marginBottom = mHeight * 0.02;
    double labelSize = mWidth * 0.055;

    showAlertDialog() {
      return showDialog<void>(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return IncompleteEntries(mHeight, incompleteEntries);
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
      if (files.isEmpty) {
        incompleteEntries.add(LanguageProvider.isEng ? "- Attach at least one file." : "- إرفاق ملف واحد على الأقل.");
      }

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
                ),
                Text(
                  lang.forwardWf,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: mWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.clear_outlined,
                    color: Theme.of(context).primaryColor,
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
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: marginBottom),
                // margin: EdgeInsets.only(bottom: marginBottom),
                height: mHeight * 1.25,
                child: Column(
                  children: [
                    WfSubject(cWidth, marginBottom, labelSize, subjectCtrl, false),
                    Container(
                      width: cWidth,
                      child: TextField(
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
                    Container(
                      width: cWidth,
                      // height: mHeight * 0.09,
                      margin: EdgeInsets.only(bottom: marginBottom),
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
                      margin: EdgeInsets.only(bottom: marginBottom),
                      child: TextField(
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
                    Container(
                      width: cWidth,
                      margin: EdgeInsets.only(bottom: marginBottom),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: mWidth * 0.75,
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
                                  fontSize: labelSize,
                                ),
                                // border: CustomBorderTextFieldSkin().getSkin(),
                                suffixIcon: recipientController.text != ''
                                    ? IconButton(
                                        icon: Icon(
                                          rcvdRcpnts.contains(recipientController.text) ? Icons.check_circle_outline : Icons.clear_outlined,
                                          color: rcvdRcpnts.contains(recipientController.text) ? Colors.green : Theme.of(context).primaryColor,
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
                            height: mHeight * 0.2,
                            child: recipients.length == 0
                                ? ListTile(
                                    leading: Icon(
                                      // Icons.account_circle,
                                      Icons.no_accounts_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    title: Text(LanguageProvider.isEng ? 'No recipient selected' : 'لم يتم تحديد مستلم'),
                                  )
                                : ListView.builder(
                                    itemCount: recipients.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Icon(
                                          Icons.account_circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        title: Text(
                                          recipients[index],
                                        ),
                                        trailing: Container(
                                          width: mWidth * 0.18,
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
                      height: mHeight * 0.25,
                      width: cWidth,
                      margin: EdgeInsets.only(bottom: marginBottom),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
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
                                    ),
                                    title: Text(LanguageProvider.isEng ? 'No attachment' : 'لا يوجد مرفق'),
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
                                                  icon: const Icon(Icons.remove_red_eye_outlined),
                                                  color: Theme.of(context).primaryColor,
                                                  onPressed: () {
                                                    viewFile(index);
                                                    // print("view file");
                                                  },
                                                ),
                                                files[index]["deletable"]
                                                    ? IconButton(
                                                        icon: const Icon(Icons.delete_outline),
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
                    ExecuteBtn(mHeight, cWidth, forward, forwarding, labelSize, LanguageProvider.isEng ? "Forward" : "إلى الأمام"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
