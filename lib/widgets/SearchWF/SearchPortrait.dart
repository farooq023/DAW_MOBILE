import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPort extends StatefulWidget {
  @override
  State<SearchPort> createState() => _SearchPortState();
}

class _SearchPortState extends State<SearchPort> {
  TextEditingController subject = TextEditingController();
  TextEditingController requisitionNo = TextEditingController();
  TextEditingController startingDate = TextEditingController();
  TextEditingController endingDate = TextEditingController();

  final _fUsername = FocusNode(), _fPassword = FocusNode();

  Keyboardoff() {
    _fUsername.unfocus();
    _fPassword.unfocus();
  }

  void _MoveToNext(_) {
    FocusScope.of(context).requestFocus(_fPassword);
  }

  void filterData() {
    //Here we check if the filter is set to true and if it is true we navigate to the inbox screen
    Navigator.pushReplacementNamed(context, '/inbox');
  }

  void clear() {
    //If the filter is set to false we clear the text fields
    Navigator.pushReplacementNamed(context, '/inbox');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mHeight = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final mWidth = size.width;
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mWidth * 0.05),
        color: Theme.of(context).backgroundColor,
      ),
      height: mHeight * 0.475,
      child: Container(
        padding: EdgeInsets.all(mWidth * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: mWidth * 0.045)),
                Text(
                  lang.search,
                  style: TextStyle(
                      fontSize: mWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,
                        color: Theme.of(context).primaryColor,
                        size: mWidth * 0.045)),
              ],
            ),
            SizedBox(height: mHeight * 0.01),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                height: mHeight * 0.35,
                child: Column(
                  children: [
                    SizedBox(height: mHeight * 0.02),
                    //This container is used to display the SUBJECT text field
                    Row(
                      children: [
                        Container(
                          width: mWidth * 0.44,
                          height: mHeight * 0.065,
                          padding:
                              EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(99, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.lerp(
                              Border.all(
                                color: Color.fromARGB(145, 79, 111, 206),
                                width: 2,
                              ),
                              Border.all(
                                color: Color.fromARGB(255, 210, 210, 210),
                                width: 1.5,
                              ),
                              0.6,
                            ),
                          ),
                          child: TextFormField(
                            onFieldSubmitted: _MoveToNext,
                            focusNode: _fUsername,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.subject, size: mWidth * 0.04),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: mWidth * 0.07,
                                minHeight: mHeight * 0.03,
                              ),
                              labelText: lang.subject,
                              labelStyle: TextStyle(
                                fontSize: mWidth * 0.03,
                              ),
                              border: InputBorder.none,
                              suffixIcon: subject.text != ''
                                  ? IconButton(
                                      icon: Icon(Icons.clear,
                                          size: mWidth * 0.04),
                                      onPressed: () {
                                        subject.clear();
                                      },
                                    )
                                  : null,
                            ),
                            controller: subject,
                            style: TextStyle(
                              fontSize: mWidth * 0.03,
                            ),
                          ),
                        ),
                        SizedBox(width: mWidth * 0.02),
                        Container(
                          width: mWidth * 0.44,
                          height: mHeight * 0.065,
                          padding:
                              EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(99, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.lerp(
                              Border.all(
                                color: Color.fromARGB(145, 79, 111, 206),
                                width: 2,
                              ),
                              Border.all(
                                color: Color.fromARGB(255, 210, 210, 210),
                                width: 1.5,
                              ),
                              0.6,
                            ),
                          ),
                          child: TextFormField(
                            focusNode: _fPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.numbers_outlined,
                                  size: mWidth * 0.04),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: mWidth * 0.07,
                                minHeight: mHeight * 0.03,
                              ),
                              labelText: lang.reqNo,
                              labelStyle: TextStyle(
                                fontSize: mWidth * 0.03,
                              ),
                              border: InputBorder.none,
                              suffixIcon: requisitionNo.text != ''
                                  ? IconButton(
                                      icon: Icon(Icons.clear,
                                          size: mWidth * 0.04),
                                      onPressed: () {
                                        requisitionNo.clear();
                                      },
                                    )
                                  : null,
                            ),
                            controller: requisitionNo,
                            style: TextStyle(
                              fontSize: mWidth * 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mHeight * 0.02),
                    Row(
                      children: [
                        Container(
                          height: mHeight * 0.06,
                          width: mWidth * 0.44,
                          padding:
                              EdgeInsets.symmetric(horizontal: mWidth * 0.015),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(99, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.lerp(
                              Border.all(
                                color: Color.fromARGB(145, 79, 111, 206),
                                width: 2,
                              ),
                              Border.all(
                                color: Color.fromARGB(255, 210, 210, 210),
                                width: 1.5,
                              ),
                              0.6, //This is the value of the animation
                            ),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.date_range, size: mWidth * 0.04),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: mWidth * 0.075,
                                minHeight: mHeight * 0.03,
                              ),
                              labelText: LanguageProvider.isEng
                                  ? 'Starting Date'
                                  : 'تاريخ البدء',
                              border: InputBorder.none,
                              suffixIcon: startingDate.text != ''
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          startingDate.clear();
                                          endingDate.clear();
                                        });
                                      },
                                      icon: Icon(Icons.clear,
                                          size: mWidth * 0.04),
                                    )
                                  : null,
                            ),
                            controller: startingDate,
                            style: TextStyle(
                              fontSize: mWidth * 0.03,
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                setState(() {
                                  String value =
                                      DateFormat('dd/MM/yyyy').format(date);
                                  startingDate.text = value;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: mWidth * 0.02),
                        Container(
                          height: mHeight * 0.06,
                          width: mWidth * 0.44,
                          padding:
                              EdgeInsets.symmetric(horizontal: mWidth * 0.015),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(99, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.lerp(
                              Border.all(
                                color: Color.fromARGB(145, 79, 111, 206),
                                width: 2,
                              ),
                              Border.all(
                                color: Color.fromARGB(255, 210, 210, 210),
                                width: 1.5,
                              ),
                              0.7,
                            ),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.date_range, size: mWidth * 0.04),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: mWidth * 0.075,
                                minHeight: mHeight * 0.03,
                              ),
                              labelText: LanguageProvider.isEng
                                  ? 'Ending Date'
                                  : 'تاريخ الانتهاء',
                              border: InputBorder.none,
                              suffixIcon: endingDate.text != ''
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          endingDate.clear();
                                        });
                                      },
                                      icon: Icon(Icons.clear,
                                          size: mWidth * 0.04),
                                    )
                                  : null,
                            ),
                            controller: endingDate,
                            style: TextStyle(
                              fontSize: mWidth * 0.03,
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                //The last date can be picked without picking the first date
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: startingDate.text != ''
                                    ? DateFormat('dd/MM/yyyy')
                                        .parse(startingDate.text)
                                    : DateTime(2020),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                setState(() {
                                  String value =
                                      DateFormat('dd/MM/yyyy').format(date);
                                  endingDate.text = value;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mHeight * 0.03),
                    //This container is used for the clear and filter button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //clear
                        Container(
                          child: CircleAvatar(
                            radius: mWidth * 0.05,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  clear();
                                });
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: mWidth * 0.05,
                              ),
                            ),
                          ),
                        ),
                        //search
                        SizedBox(width: mWidth * 0.02),
                        Container(
                          child: CircleAvatar(
                            radius: mWidth * 0.05,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  filterData();
                                });
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: mWidth * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
