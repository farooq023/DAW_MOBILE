import 'package:flutter/material.dart';

class ExecuteBtnTablet extends StatelessWidget {
  double btnHeight;
  double btnWidth;
  VoidCallback execute;
  bool launching;
  double labelSize;
  String btnLabel;

  ExecuteBtnTablet(this.btnHeight, this.btnWidth, this.execute, this.launching, this.labelSize, this.btnLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: execute,
        child: launching
            ? CircularProgressIndicator(
                color: Theme.of(context).backgroundColor,
              )
            : Text(
                btnLabel,
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontSize: labelSize,
                ),
              ),
      ),
    );
  }
}
