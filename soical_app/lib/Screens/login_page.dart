import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soical_app/Screens/sign_up_page.dart';

import '../AppLocalizations.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final BuildContext _context;

  LoginPage(this._context);

  @override
  State<StatefulWidget> createState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return _LoginPageState(_context);
  }
}

class _LoginPageState extends State<LoginPage> {
  final BuildContext _context;
  _LoginPageState(this._context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF8185E2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(_context)},
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(_context).size.width,
              height: MediaQuery.of(_context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF8185E2), Color(0xFF8185E2)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        AppLocalizations.of(_context).translate("Login"),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(_context).size.height / 2,
              width: MediaQuery.of(_context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 60,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF8185E2),
                        ),
                        hintText:
                            AppLocalizations.of(_context).translate('Username'),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(_context).size.width / 1.2,
                    height: 60,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xFF8185E2),
                        ),
                        hintText:
                            AppLocalizations.of(_context).translate('Password'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(_context, '/');
                    },
                    child: InkWell(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(_context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF8185E2),
                                Color(0xFF8185E2),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(_context).translate('Login'),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()))
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(_context)
                      .translate("Don't have an account ? ")),
                  Text(
                    AppLocalizations.of(_context).translate("Sign Up"),
                    style: TextStyle(color: Color(0xFF8185E2)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(_context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
