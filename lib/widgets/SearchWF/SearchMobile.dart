import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:daw_mobile/providers/languageProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchMobile extends StatefulWidget {
  @override
  State<SearchMobile> createState() => _SearchMobileState();
}

class _SearchMobileState extends State<SearchMobile> {
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
    final mHeight = size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    final mWidth = size.width;
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mWidth * 0.05),
        color: Theme.of(context).backgroundColor,
      ),
      height: mHeight * 0.82,
      child: Container(
        padding: EdgeInsets.all(mWidth * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                  onPressed: () {},
                ),
                Text(
                  lang.search,
                  style: TextStyle(fontSize: mWidth * 0.05, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02),
                height: mHeight * 0.62,
                child: Column(
                  children: [
                    SizedBox(height: mHeight * 0.02),
                    //This container is used to display the SUBJECT text field
                    Container(
                      height: lang.localeName == 'en' ? mHeight * 0.085 : mHeight * 0.09,
                      padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02),
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
                          prefixIcon: Icon(Icons.subject),
                          labelText: lang.subject,
                          border: InputBorder.none,
                          suffixIcon: subject.text != ''
                              ? IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    subject.clear();
                                  },
                                )
                              : null,
                        ),
                        controller: subject,
                      ),
                    ),
                    //This container is used to display the REQUISITION NO text field
                    SizedBox(height: mHeight * 0.02),
                    Container(
                      height: lang.localeName == 'en' ? mHeight * 0.085 : mHeight * 0.09,
                      padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02),
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
                          prefixIcon: Icon(Icons.numbers_outlined),
                          labelText: lang.reqNo,
                          border: InputBorder.none,
                          suffixIcon: requisitionNo.text != ''
                              ? IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    requisitionNo.clear();
                                  },
                                )
                              : null,
                        ),
                        controller: requisitionNo,
                      ),
                    ),
                    //Add start date and end date in the same field
                    SizedBox(height: mHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: lang.localeName == 'en' ? mHeight * 0.085 : mHeight * 0.09,
                          width: mWidth * 0.44,
                          padding: EdgeInsets.symmetric(horizontal: mWidth * 0.015),
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
                              prefixIcon: Icon(Icons.date_range),
                              labelText: LanguageProvider.isEng ? 'Start Date' : 'تاريخ البدء',
                              border: InputBorder.none,
                              suffixIcon: startingDate.text != ''
                                  ? GestureDetector(
                                      onTap: () {
                                        startingDate.clear();
                                        endingDate.clear();
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : null,
                            ),
                            controller: startingDate,
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
                                  String value = DateFormat('dd/MM/yyyy').format(date);
                                  startingDate.text = value;
                                });
                              }
                            },
                          ),
                        ),
                        Container(
                          height: lang.localeName == 'en' ? mHeight * 0.085 : mHeight * 0.09,
                          width: mWidth * 0.44,
                          padding: EdgeInsets.symmetric(horizontal: mWidth * 0.015),
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
                              prefixIcon: Icon(Icons.date_range),
                              labelText: LanguageProvider.isEng ? 'End Date' : 'تاريخ الانتهاء',
                              border: InputBorder.none,
                              suffixIcon: endingDate.text != ''
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          endingDate.clear();
                                        });
                                      },
                                      icon: const Icon(Icons.clear),
                                    )
                                  : null,
                            ),
                            controller: endingDate,
                            readOnly: true,
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                //The last date can be picked without picking the first date
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: startingDate.text != '' ? DateFormat('dd/MM/yyyy').parse(startingDate.text) : DateTime(2020),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                setState(() {
                                  String value = DateFormat('dd/MM/yyyy').format(date);
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
                            radius: mWidth * 0.07,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: mWidth * 0.075,
                              ),
                              onPressed: () {
                                setState(() {
                                  clear();
                                });
                              },
                            ),
                          ),
                        ),
                        //search
                        SizedBox(width: mWidth * 0.03),
                        Container(
                          child: CircleAvatar(
                            radius: mWidth * 0.07,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                                size: mWidth * 0.075,
                              ),
                              onPressed: () {
                                setState(() {
                                  clear();
                                });
                              },
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
