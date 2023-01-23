import 'package:flutter/material.dart';

class IncompleteEntriesTablet extends StatelessWidget {
  double dialogHeight;
  double dialogWidth;
  double textSize;
  List<String> incompleteEntries;
  double iconSize;
  IncompleteEntriesTablet(this.dialogHeight, this.dialogWidth, this.textSize, this.incompleteEntries, this.iconSize);

  Widget incompleteEntriesDialog() {
    return Container(
      height: dialogHeight,
      // width: double.maxFinite,
      width: dialogWidth,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: incompleteEntries.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            incompleteEntries[index],
            style: TextStyle(
              fontSize: textSize,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Icon(
        Icons.warning,
        color: Colors.red,
        size: iconSize,
      ),
      content: incompleteEntriesDialog(),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: TextStyle(
              fontSize: textSize,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
