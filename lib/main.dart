import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/screens/my_detail_page.dart';
import 'package:simple_getx_app/screens/my_home_page.dart';
import 'package:simple_getx_app/screens/recent_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MyHomePage()),
        GetPage(name: "/detail", page: () => DetailPage()),
        GetPage(name: "/recent", page: () => RecentContest())
      ],
    );
  }
}
