import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakna/json.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'core/screvice_locator/screvices.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await ServicesLector.init();
  runApp(const Rakna());
}

void setOrientations() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}
