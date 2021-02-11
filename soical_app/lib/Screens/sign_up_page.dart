import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:soical_app/Model/User.dart';
import 'package:soical_app/Util/SharedPref.dart';

import '../AppLocalizations.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String error = "";
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _autoValidate = false;
  String nameController;
  String mailController;
  String nationalIdController;
  String mobileController;
  String areaController;
  String streetController;
  String buildingController;
  String apartmentController;
  SharedPref sharedPref = SharedPref();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  Future<dynamic> register(
      String name,
      String mail,
      String nationalId,
      String mobile,
      String area,
      String street,
      String building,
      String apartment) async {
    User user =
        User(name, mail, nationalId, mobile, area, street, building, apartment);

    setState(() {
      isLoading = true;
    });
    final http.Response response = await http.post(
      'https://emvi.herokuapp.com/api/v1/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'mail': mail,
        'nationalId': nationalId,
        'mobile': mobile,
        'area': area,
        'street': street,
        'building': building,
        'apartment': apartment
      }),
    );
    if (response.statusCode == 200) {
      sharedPref.save("user", user);
      return "True";
    } else {
      throw Exception('Error');
    }
  }

  _sendToServer() {
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();
      register(
              nameController,
              "",
              nationalIdController,
              mobileController,
              areaController,
              streetController,
              buildingController,
              apartmentController)
          .then((value) => {
                setState(() {
                  isLoading = false;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                })
              })
          .catchError((error) {
        print(error);
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF8185E2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              // ignore: deprecated_member_use
              autovalidate: _autoValidate,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF8185E2), Color(0xFF8185E2)],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90))),
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
                              padding:
                                  const EdgeInsets.only(bottom: 32, right: 32),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('Sign Up'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                nameController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Full Name should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Full Name'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                nationalIdController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context).translate(
                                      'National Id should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('National Id'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                mobileController = value;
                              },
                              keyboardType: TextInputType.phone,
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Phone should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Phone'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                areaController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Area should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Area'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                streetController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Street should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Street'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                apartmentController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Apartment should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Apartment'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextFormField(
                              onSaved: (String value) {
                                buildingController = value;
                              },
                              validator: (String arg) {
                                if (arg.isEmpty)
                                  return AppLocalizations.of(context)
                                      .translate('Building should not empty');
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate('Building'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              _sendToServer();
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2,
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
                                  AppLocalizations.of(context)
                                      .translate('Register'),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(AppLocalizations.of(context)
                                      .translate("Have an account ? ")),
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate("Login"),
                                    style: TextStyle(color: Color(0xFF8185E2)),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
