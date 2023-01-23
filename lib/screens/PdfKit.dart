import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'package:pspdfkit_flutter/widgets/pspdfkit_widget.dart';

import '../models/errorDialog.dart';
import '../models/Notifications.dart';

import '../widgets/mainDrawer.dart';

class PdfKit extends StatefulWidget {
  static const routeName = '/pdfkit';

  @override
  State<PdfKit> createState() => _PdfKitState();
}

class _PdfKitState extends State<PdfKit> {
  String finalPath = "";
  String docPath = 'assets/PDFs/Document.pdf';

  // @override
  // void initState() {
  //   showDocument();
  // }

  void showDocument() async {
    print("started");
    final bytes = await DefaultAssetBundle.of(context).load(docPath);
    final list = bytes.buffer.asUint8List();
    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$docPath';
    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    await Pspdfkit.present(tempDocumentPath, {});

    // print(tempDocumentPath);
    // setState(() {
    //   finalPath = tempDocumentPath;
    // });

    // print("path set");
    // await Pspdfkit.present("https://www.africau.edu/images/default/sample.pdf");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: mHeight * 0.075,
        title: Text(
          lang.viewPdf,
          style: TextStyle(fontSize: mWidth * 0.05),
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
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: mWidth * 0.07,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: mWidth * 0.03,
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: appDrawer(mWidth, mHeight),

      body: Container(
        height: mHeight,
        width: mWidth,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     width: 4,
        //     color: Colors.purple,
        //   ),
        // ),
        child: Center(
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 4,
            //     color: Colors.purple,
            //   ),
            // ),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text(lang.viewPdf),
                  onPressed: () => showDocument(),
                ),
                // ElevatedButton(
                //   child: Text(lang.viewPdf),
                //   onPressed: () => showDocument(),
                // ),
              ],
            ),
          ),
        ),
      ),

      // body: Container(
      //   height: mHeight,
      //   width: mWidth,

      //   // decoration: BoxDecoration(
      //   //   border: Border.all(
      //   //     width: 4,
      //   //     color: Colors.purple,
      //   //   ),
      //   // ),

      //   // child: finalPath == ""
      //   //     ? const CircularProgressIndicator()
      //   //     : PspdfkitWidget(
      //   //         documentPath: finalPath,
      //   //       ),

      //   // child: PspdfkitWidget(
      //   //   documentPath: docPath,
      //   // ),
      // ),
    );
  }
}
