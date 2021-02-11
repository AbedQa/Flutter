import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:soical_app/Model/User.dart';
import 'package:soical_app/Util/SharedPref.dart';

import '../AppLocalizations.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  SharedPref sharedPref = SharedPref();
  var isLoading = false;
  User userLoad;
  Future<dynamic> call(String nationalId) async {
    setState(() {
      isLoading = true;
    });
    final http.Response response = await http.post(
      'https://emvi.herokuapp.com/api/v1/call',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nationalId': nationalId,
      }),
    );
    if (response.statusCode == 200) {
      return "True";
    } else {
      throw Exception('Error');
    }
  }

  loadSharedPrefs() async {
    try {
      User user = User.fromJson(await sharedPref.read("user"));
      setState(() {
        userLoad = user;
      });
    } catch (Excepetion) {}
  }

  @override
  void initState() {
    loadSharedPrefs();
    super.initState();
  }

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("Home")),
        elevation: 0,
        backgroundColor: Color(0xFF8185E2),
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => {Navigator.pushNamed(context, '/')},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                call(userLoad == null ? "" : userLoad.nationalId)
                    .then((value) => {
                          setState(() {
                            visible = false;
                          })
                        })
                    .catchError((error) {});
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8185E2),
                        Color(0xFF8185E2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    !visible
                        ? AppLocalizations.of(context).translate("Close")
                        : AppLocalizations.of(context).translate("I need Help"),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: visible ? 0 : 20.0,
              child: Text(AppLocalizations.of(context)
                  .translate("Your request done & we will visit you now")),
            ),
          ],
        ),
      ),
    );
  }
}
