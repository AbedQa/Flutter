import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soical_app/Screens/login_page.dart';
import 'package:soical_app/Screens/sign_up_page.dart';
import 'package:soical_app/Util/SharedPref.dart';
import '../AppLocalizations.dart';
import '../delayed_animation.dart';

class WelcomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  SharedPref shaderPref = SharedPref();
  double _scale;
  List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  AnimationController _controller;
  var index = 0;
  @override
  void initState() {
    if (shaderPref == null) {
      index = 0;
    } else {
      if (shaderPref.read("Lang") == null) {
        index = 0;
      } else {
        index = shaderPref.read("Lang") == "en" ? 0 : 1;
      }
    }

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  changeLanguage(int index) {
    setState(() {
      this.index = index;
      shaderPref.save("Lang", index == 0 ? "en" : "ar");
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      locale: supportedLocales[index],
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (ctx) {
        return Scaffold(
            appBar: AppBar(
              title: Text(""),
              elevation: 0,
              backgroundColor: Color(0xFF8185E2),
              leading: Container(),
              actions: [
                IconButton(
                  icon: Text(
                    index == 0 ? 'Ar' : 'En',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                  ),
                  onPressed: () => {changeLanguage(index == 0 ? 1 : 0)},
                ),
              ],
            ),
            backgroundColor: Color(0xFF8185E2),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 90,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 2),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: FlutterLogo(
                            size: 50.0,
                          ),
                          radius: 50.0,
                        )),
                  ),
                  DelayedAnimation(
                    child: Text(
                      AppLocalizations.of(ctx).translate('Hi There'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: color),
                    ),
                    delay: delayedAmount + 1000,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  InkWell(
                    child: DelayedAnimation(
                      child: Transform.scale(
                        scale: _scale,
                        child: _animatedRegisterButtonUI(ctx),
                      ),
                      delay: delayedAmount + 1000,
                    ),
                    onTap: () => {
                      Navigator.push(ctx,
                          MaterialPageRoute(builder: (context) => SignupPage()))
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    child: DelayedAnimation(
                      child: Transform.scale(
                        scale: _scale,
                        child: _animatedLoginButtonUI(ctx),
                      ),
                      delay: delayedAmount + 1000,
                    ),
                    onTap: () => {
                      Navigator.push(
                          ctx,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(context)))
                    },
                  ),
                ],
              ),
            ));
      }),
    );
  }

  Widget _animatedRegisterButtonUI(BuildContext ctx) {
    return Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(ctx).translate('Register'),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8185E2),
          ),
        ),
      ),
    );
  }

  Widget _animatedLoginButtonUI(BuildContext context) {
    return Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context).translate('Login'),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8185E2),
          ),
        ),
      ),
    );
  }
}
