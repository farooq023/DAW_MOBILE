import 'package:flutter/material.dart';

class settingsBox extends StatefulWidget {
  @override
  State<settingsBox> createState() => _settingsBoxState();
}

class _settingsBoxState extends State<settingsBox> {
  TextEditingController url = TextEditingController();
  TextEditingController host = TextEditingController();

  final _fUsername = FocusNode(), _fPassword = FocusNode();

  Keyboardoff() {
    _fUsername.unfocus();
    _fPassword.unfocus();
  }

  void _MoveToNext(_) {
    FocusScope.of(context).requestFocus(_fPassword);
  }

//Clear the text fields
  void clear() {
    url.clear();
    host.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mHeight = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final mWidth = size.width;
    return Container(
      height: mHeight * 0.5,
      //add a background with liner gradient
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 31, 92, 167),
            Color.fromARGB(255, 49, 128, 224),
            Color.fromARGB(255, 95, 160, 238),
            Color.fromARGB(255, 137, 188, 252),
            Color.fromARGB(255, 173, 210, 255),
            Color.fromARGB(255, 206, 228, 255),
            Color.fromARGB(255, 236, 245, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: mHeight * 0.64,
            child: Column(
              children: [
                //This container is used to display the heading of the filtering screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      transform:
                          Matrix4.translationValues(mWidth * 0.05, 0.0, 0.0),
                      padding: EdgeInsets.all(mHeight * 0.02),
                      margin: EdgeInsets.only(top: mHeight * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: BoxBorder.lerp(
                          Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          Border.all(
                            color: Color.fromARGB(145, 79, 111, 206),
                            width: 1.5,
                          ),
                          0.4,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 69, 120, 202),
                              blurRadius: 80,
                              offset: Offset(5, 5)),
                        ],
                      ),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Container(
                      transform:
                          Matrix4.translationValues(-mWidth * 0.55, 0.0, 0.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                //Create closing icon

                SizedBox(height: mHeight * 0.03),
                //This container is used to display the SUBJECT text field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.04),
                  child: Container(
                    height: mHeight * 0.075,
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
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 210, 210, 210),
                            blurRadius: 90,
                            spreadRadius: 5,
                            offset: Offset(5, 5)),
                      ],
                    ),
                    child: TextFormField(
                      onFieldSubmitted: _MoveToNext,
                      focusNode: _fUsername,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        //create a prefix icon for the text field with url icon
                        prefixIcon: Icon(Icons.link),
                        labelText: 'Enter the URL',
                        border: InputBorder.none,
                        suffixIcon: url.text != ''
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  url.clear();
                                },
                              )
                            : null,
                      ),
                      controller: url,
                    ),
                  ),
                ),
                //This container is used to display the REQUISITION NO text field
                SizedBox(height: mHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.04),
                  child: Container(
                    height: mHeight * 0.075,
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
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(5, 5)),
                      ],
                    ),
                    child: TextFormField(
                      focusNode: _fPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.web),
                        labelText: 'Enter the Host',
                        border: InputBorder.none,
                        suffixIcon: host.text != ''
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  host.clear();
                                },
                              )
                            : null,
                      ),
                      controller: host,
                    ),
                  ),
                ),

                SizedBox(height: mHeight * 0.03),
                //This container is used for the clear and filter button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //This container is used to display the clear button
                      Container(
                        width: mWidth * 0.275,
                        height: mHeight * 0.06,
                        child: ElevatedButton(
                          child: Text('Clear',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Color.fromARGB(255, 253, 253, 255),
                              ),
                              textAlign: TextAlign.center),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 52, 79, 170)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 18))),
                          onPressed: clear,
                        ),
                      ),
                      SizedBox(width: mWidth * 0.03),
                      Container(
                        width: mWidth * 0.275,
                        height: mHeight * 0.06,
                        child: ElevatedButton(
                          child: Text('Submit',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Color.fromARGB(255, 253, 253, 255),
                              ),
                              textAlign: TextAlign.center),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColorDark),
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 39, 60, 130)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 18))),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
