import 'package:flutter/material.dart';
import 'Dashboard.dart';

class Login2 extends StatefulWidget {
  static const routeName = '/login2';

  @override
  State<Login2> createState() => _LoginState();
}

class _LoginState extends State<Login2> {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final _focusU = FocusNode(), _focusP = FocusNode();
  void _nextText(_) {
    FocusScope.of(context).requestFocus(_focusP);
  }

  void submit() {
    if (usernameCtrl.text == "a" && passwordCtrl.text == "a")
      Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    var mHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var mWidth = mSize.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: mHeight,
          width: mWidth,
          child: Container(
            height: mHeight * 0.93,
            child: Center(
              // alignment: Alignment.center,
              child: Container(
                height: mHeight * 0.8,
                width: mWidth * 0.8,
                // color: Colors.pink,
                // decoration: const BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(25)),
                //   color: Colors.black,
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image.asset('assets/images/appLogo.jpg'),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Document Automated',
                        // AppLocalizations.of(context)!.documentAutomated,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        // 'Workflow',
                        // AppLocalizations.of(context)!.workflow,
                        "Workflow",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Text(
                          // 'User Login',
                          // AppLocalizations.of(context)!.userLogin,
                          "User Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 30),
                      child: Container(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: usernameCtrl,
                              // enabled: spin == 1 ? false : true,
                              onSubmitted: _nextText,
                              // onTap: _clear,
                              focusNode: _focusU,
                              textInputAction: TextInputAction.next,
                              cursorColor: Theme.of(context).primaryColor,
                              // onChanged: (val) => {name = val},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).backgroundColor,
                                // labelText: AppLocalizations.of(context)!.username,
                                labelText: "Username",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              child: TextField(
                                // enabled: spin == 1 ? false : true,
                                // onSubmitted: (_) {
                                //   _submit();
                                // },
                                controller: passwordCtrl,
                                cursorColor: Theme.of(context).primaryColor,
                                // onTap: _clear,
                                focusNode: _focusP,
                                textInputAction: TextInputAction.send,
                                obscureText: true,
                                // onChanged: (val) => {pass = val},
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(context).backgroundColor,
                                  // labelText: AppLocalizations.of(context)!.password,
                                  labelText: "Password",
                                  border: const UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  // iconColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),

                            // if (fill == 0 && inv == 0 && err == 0)
                            //   Container(
                            //     child: const Text(
                            //       "",
                            //       style: TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.red,
                            //       ),
                            //     ),
                            //   ),

                            // if (fill == 1)
                            //   Container(
                            //     child: Text(
                            //       AppLocalizations.of(context)!.fill,
                            //       style: const TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.red,
                            //       ),
                            //     ),
                            //   ),

                            // if (inv == 1)
                            //   Container(
                            //     child: Text(
                            //       AppLocalizations.of(context)!.inv,
                            //       style: const TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.red,
                            //       ),
                            //     ),
                            //   ),

                            // if (err == 1)
                            //   Container(
                            //     child: Text(
                            //       AppLocalizations.of(context)!.err,
                            //       style: const TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.red,
                            //       ),
                            //     ),
                            //   ),

                            Container(
                              height: mHeight * 0.08,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                // onPressed: _submit,
                                // onPressed: spin == 1 ? null : _submit,
                                onPressed: submit,
                                child: Text(
                                  'Enter',
                                  // AppLocalizations.of(context)!.enter,
                                  style: const TextStyle(fontSize: 21),
                                ),
                              ),
                            ),
                            // Center(
                            //   child: spin != 0
                            //       ? CircularProgressIndicator(
                            //           color: Theme.of(context).primaryColor,
                            //         )
                            //       : null,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
