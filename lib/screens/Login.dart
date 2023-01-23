import 'package:daw_mobile/screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/errorDialog.dart';

import '../providers/languageProvider.dart';

import './Settings.dart';

import '../widgets/LoginHeader.dart';
import '../widgets/Loginbtn.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<Login> createState() => _loginScreenState();
}

class _loginScreenState extends State<Login> {
  String name = '', password = '';
  int fieldsError = 0, InvalidCredentials = 0;
  final _fUsername = FocusNode(), _fPassword = FocusNode();

  var _isLoading = 0;
  bool _passwordVisible = false;

  // void modal() {
  //   showModalBottomSheet(
  //       isDismissible: false,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(30.0),
  //         ),
  //       ),
  //       context: context,
  //       builder: (_) {
  //         return settingsBox();
  //       });
  // }

  void _MoveToNext(_) {
    FocusScope.of(context).requestFocus(_fPassword);
  }

  Keyboardoff() {
    _fUsername.unfocus();
    _fPassword.unfocus();
  }

  void _clear() {
    setState(() {
      fieldsError = 0;
      InvalidCredentials = 0;
      _isLoading = 0;
    });
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void changeLang() {
    Provider.of<LanguageProvider>(context, listen: false).switchLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = size.width;
    final isLANDSCAPE = MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var lang = AppLocalizations.of(context)!;

    if (mWidth < 481) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    void submit() {
      // Navigator.pushReplacementNamed(context, '/dashboard');
      if (name == 'a' && password == 'a') {
        Navigator.pushReplacementNamed(context, Dashboard.routeName);
      } else if (name == '' || password == '') {
        showErrorDialog(lang.fill, lang.enterCredentials, context);
      } else {
        showErrorDialog(lang.inv, lang.inv, context);
      }
    }

    // double headerHeight = mHeight * 0.4;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          //=======================This is for the tablet view in case the screen is in portrate mode=========================/
          child: mWidth > 480
              ? isPortrait
                  ? Column(
                      children: [
                        Container(
                          child: LoginHeader(mHeight * 0.4, mWidth),
                        ),
                        SizedBox(
                          height: mHeight * 0.05,
                        ),
                        Container(
                          // height: mHeight * 0.6,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: mWidth * 0.07),
                                  child: Center(
                                    child: Text(
                                      // 'نظام المراسلات الداخلية',
                                      // 'Internal Correspondence System',
                                      lang.internalCorp,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: mWidth * 0.06,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mHeight * 0.05,
                                ),
                                Padding(
                                  //This padding is for the text field borders
                                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02, vertical: mHeight * 0.005),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: mWidth * 0.035),
                                      enabled: _isLoading == 1 ? false : true,
                                      onFieldSubmitted: _MoveToNext,
                                      onTap: _clear,
                                      focusNode: _fUsername,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: mWidth * 0.001,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          size: mWidth * 0.05,
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                          minWidth: mWidth * 0.1,
                                        ),
                                        // labelText: 'أدخل إسم المستخدم',
                                        labelText: lang.username,
                                        labelStyle: TextStyle(
                                          fontSize: mWidth * 0.035,
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                                //Enter the password
                                SizedBox(
                                  height: mHeight * 0.03,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: mWidth * 0.02, vertical: mHeight * 0.005),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: mWidth * 0.035),
                                      enabled: _isLoading == 1 ? false : true,
                                      onTap: _clear,
                                      focusNode: _fPassword,
                                      textInputAction: TextInputAction.done,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: mWidth * 0.001,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          size: mWidth * 0.05,
                                        ),
                                        //create a space between the icon and the text
                                        prefixIconConstraints: BoxConstraints(
                                          minWidth: mWidth * 0.1,
                                        ),
                                        // labelText: 'أدخل كلمة المرور',
                                        labelText: lang.password,
                                        labelStyle: TextStyle(
                                          fontSize: mWidth * 0.035,
                                        ),
                                        //create a space between the text and the icon

                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                              color: Theme.of(context).primaryColorDark,
                                              size: mWidth * 0.05,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible = !_passwordVisible;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mHeight * 0.04,
                                ),
                                LoginBtn(mHeight, mWidth, submit),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: mHeight * 0.03,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //Add two icons
                                    // if the screen == tablet, increase the size of the icons, else keep it the same
                                    children: [
                                      Container(
                                        child: IconButton(
                                          iconSize: mWidth * 0.09,
                                          icon: Icon(Icons.language),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: changeLang,
                                        ),
                                      ),
                                      SizedBox(
                                        width: mWidth * 0.01,
                                      ),
                                      Container(
                                        child: IconButton(
                                          iconSize: mWidth * 0.09,
                                          icon: Icon(Icons.settings),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Settings(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      //=======================This is for the tablet view in case the screen is in landscape mode=========================/
                    )
                  : Column(
                      children: [
                        Container(
                          child: LoginHeader(mHeight * 0.5, mWidth),
                        ),
                        SizedBox(
                          height: mHeight * 0.05,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mWidth * 0.05,
                                  ),
                                  Container(
                                    width: mWidth * 0.6,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              // 'نظام المراسلات الداخلية',
                                              // 'Internal Correspondence System',
                                              lang.internalCorp,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontSize: mWidth * 0.035,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: mHeight * 0.05,
                                        ),
                                        Container(
                                          width: mWidth * 0.4,
                                          // height: mHeight * 0.12,
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: mWidth * 0.001,
                                          //     vertical: mHeight * 0.0005),
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //   color: Color.fromRGBO(
                                            //       11, 94, 255, 1),
                                            // ),
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(mWidth * 0.02),
                                          ),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: mWidth * 0.02),
                                            enabled: _isLoading == 1 ? false : true,
                                            onFieldSubmitted: _MoveToNext,
                                            onTap: _clear,
                                            focusNode: _fUsername,
                                            textInputAction: TextInputAction.next,
                                            onChanged: (value) {
                                              setState(() {
                                                name = value;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: mWidth * 0.001,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.person,
                                                size: mWidth * 0.03,
                                              ),
                                              prefixIconConstraints: BoxConstraints(
                                                minWidth: mWidth * 0.1,
                                              ),
                                              // labelText: 'أدخل إسم المستخدم',
                                              labelText: lang.username,
                                              labelStyle: TextStyle(
                                                fontSize: mWidth * 0.025,
                                              ),
                                            ),
                                            keyboardType: TextInputType.emailAddress,
                                          ),
                                        ),
                                        //Enter the password
                                        SizedBox(
                                          height: mHeight * 0.03,
                                        ),
                                        Container(
                                          width: mWidth * 0.4,
                                          // height: mHeight * 0.12,
                                          // padding: EdgeInsets.only(
                                          //   right: mWidth * 0.03,
                                          //   left: mWidth * 0.001,
                                          // ),
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //   color: Color.fromRGBO(
                                            //       11, 94, 255, 1),
                                            // ),
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(mWidth * 0.02),
                                          ),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: mWidth * 0.02),
                                            enabled: _isLoading == 1 ? false : true,
                                            onTap: _clear,
                                            focusNode: _fPassword,
                                            textInputAction: TextInputAction.done,
                                            onChanged: (value) {
                                              setState(() {
                                                password = value;
                                              });
                                            },
                                            obscureText: !_passwordVisible,
                                            decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: mWidth * 0.001,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                size: mWidth * 0.03,
                                              ),
                                              //create a space between the icon and the text
                                              prefixIconConstraints: BoxConstraints(
                                                minWidth: mWidth * 0.1,
                                              ),
                                              // labelText: 'أدخل كلمة المرور',
                                              labelText: lang.password,
                                              labelStyle: TextStyle(
                                                fontSize: mWidth * 0.025,
                                              ),
                                              //create a space between the text and the icon

                                              suffixIcon: Container(
                                                width: mWidth * 0.07,
                                                alignment: Alignment.center,
                                                // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                                child: IconButton(
                                                    icon: Icon(
                                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                      color: Theme.of(context).primaryColorDark,
                                                      size: mWidth * 0.03,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _passwordVisible = !_passwordVisible;
                                                      });
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: mWidth * 0.02,
                                  ),
                                  //This container is used for the other column
                                  Container(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: mHeight * 0.05,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: mHeight * 0.03,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          //Add two icons
                                          // if the screen == tablet, increase the size of the icons, else keep it the same
                                          children: [
                                            Container(
                                              child: IconButton(
                                                iconSize: mWidth * 0.05,
                                                icon: Icon(Icons.language),
                                                color: Theme.of(context).primaryColor,
                                                onPressed: changeLang,
                                              ),
                                            ),
                                            SizedBox(
                                              width: mWidth * 0.01,
                                            ),
                                            Container(
                                              child: IconButton(
                                                iconSize: mWidth * 0.05,
                                                icon: Icon(Icons.settings),
                                                color: Theme.of(context).primaryColor,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Settings(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: mHeight * 0.07,
                                      ),
                                      LoginBtn(mHeight, mWidth, submit),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
              //=======================//This is for the mobile version, portrait mode=========================/
              //Don't allow the landscape mode here
              : Column(
                  children: [
                    Container(
                      child: LoginHeader(mHeight * 0.4, mWidth),
                    ),
                    SizedBox(
                      height: mHeight * 0.05,
                    ),
                    Container(
                      // height: mHeight * 0.6,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                              child: Center(
                                child: Text(
                                  // 'نظام المراسلات الداخلية',
                                  lang.internalCorp,
                                  // 'Internal Correspondence System',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: mWidth * 0.08,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 0.05,
                            ),
                            Padding(
                              //This padding is for the text field borders
                              padding: EdgeInsets.symmetric(horizontal: mWidth * 0.09),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: mWidth * 0.02,
                                ),
                                child: TextFormField(
                                  enabled: _isLoading == 1 ? false : true,
                                  onFieldSubmitted: _MoveToNext,
                                  onTap: _clear,
                                  focusNode: _fUsername,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: mWidth * 0.002,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: mWidth * 0.07,
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: mWidth * 0.12,
                                    ),
                                    // labelText: 'أدخل إسم المستخدم',
                                    labelText: lang.username,
                                    labelStyle: TextStyle(
                                      fontSize: mWidth * 0.05,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            //Enter the password
                            SizedBox(
                              height: mHeight * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: mWidth * 0.09),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: mWidth * 0.02,
                                ),
                                child: TextFormField(
                                  enabled: _isLoading == 1 ? false : true,
                                  onTap: _clear,
                                  focusNode: _fPassword,
                                  textInputAction: TextInputAction.done,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: mWidth * 0.001,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: mWidth * 0.07,
                                    ),
                                    //create a space between the icon and the text
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: mWidth * 0.12,
                                    ),
                                    // labelText: 'أدخل كلمة المرور',
                                    labelText: lang.password,
                                    labelStyle: TextStyle(
                                      fontSize: mWidth * 0.05,
                                    ),
                                    //create a space between the text and the icon

                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                          color: Theme.of(context).primaryColorDark,
                                          size: mWidth * 0.06,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 0.04,
                            ),
                            LoginBtn(mHeight, mWidth, submit),
                            Padding(
                              padding: EdgeInsets.only(
                                top: mHeight * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //Add two icons
                                // if the screen == tablet, increase the size of the icons, else keep it the same
                                children: [
                                  Container(
                                    child: IconButton(
                                      iconSize: mWidth * 0.09,
                                      icon: Icon(Icons.language),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: changeLang,
                                    ),
                                  ),
                                  SizedBox(
                                    width: mWidth * 0.01,
                                  ),
                                  Container(
                                    child: IconButton(
                                      iconSize: mWidth * 0.09,
                                      icon: Icon(Icons.settings),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Settings(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  //lock the landscape mode
                ),
        ),
      ),
    );
  }
}
