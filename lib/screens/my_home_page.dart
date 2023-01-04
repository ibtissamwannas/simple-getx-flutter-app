import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/screens/constants/dimentions.dart';
import 'package:simple_getx_app/screens/content_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: Dimentions.screenHeight,
            child: Container(
              height: Dimentions.screenHeight,
              width: Dimentions.screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/background.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              bottom: 0,
              left: Dimentions.width20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pick Your Favourite",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Contests",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Dimentions.height20,
                  ),
                  SizedBox(
                      width: Dimentions.screenWidth - 25,
                      child: const Text(
                        "We make great design work "
                        "happen with our great community designer",
                        style: TextStyle(color: Colors.white60),
                      )),
                  SizedBox(
                    height: Dimentions.height45,
                  ),
                  Container(
                    width: Dimentions.width200,
                    height: Dimentions.height70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFffbc33e)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xFFfbc33e),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () => Get.to(() => ContentPage()),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimentions.height70,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
