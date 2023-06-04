import 'package:cocktail_fp/pages/bottom_nav_bar.dart';
import 'package:cocktail_fp/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'helper/hive_boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveBoxes.initHive();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var indexNav = prefs.getInt('nav');
  runApp(MyApp(
    indexNav: indexNav,
  ));
}

class MyApp extends StatelessWidget {
  int? indexNav;
  MyApp({Key? key, required this.indexNav}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FP Cocktail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: indexNav == null ? SplashPage() : BottomNavBar(),
    );
  }
}
