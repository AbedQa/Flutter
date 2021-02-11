import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Screens/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(WelcomePage());
}
