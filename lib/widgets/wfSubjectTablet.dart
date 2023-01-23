import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WfSubjectTablet extends StatefulWidget {
  double cWidth;
  double textSize;
  double labelSize;
  TextEditingController subjectCtrl;
  bool suffix;

  WfSubjectTablet(this.cWidth, this.textSize, this.labelSize, this.subjectCtrl, this.suffix);

  @override
  State<WfSubjectTablet> createState() => _WfSubjectState();
}

class _WfSubjectState extends State<WfSubjectTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cWidth,
      child: TextField(
        style: TextStyle(fontSize: widget.textSize),
        controller: widget.subjectCtrl,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: AppLocalizations.of(context)!.subject,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: widget.labelSize,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          suffixIcon: widget.subjectCtrl.text != '' && widget.suffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.subjectCtrl.clear();
                    });
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : null,
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
