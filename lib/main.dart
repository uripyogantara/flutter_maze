import 'package:fazz_game/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:fazz_game/page/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Routes(initialRoute: Dashboard.PATH);
  }
}
