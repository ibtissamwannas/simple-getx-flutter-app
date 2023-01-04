import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/controller/detail_controller.dart';
import 'package:simple_getx_app/screens/constants/dimentions.dart';

import 'content_page.dart';
import 'my_home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List images = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/img.json")
        .then((s) => {
              setState(() {
                images = json.decode(s);
              })
            });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DetailController fav = Get.put(DetailController());
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        color: Color(0xFFc5e5f3),
        child: Stack(
          children: [
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  onPressed: () => Get.to(() => ContentPage()),
                  icon: Icon(Icons.arrow_back_ios),
                )),
            Positioned(
              top: Dimentions.height90,
              left: 0,
              height: Dimentions.height100,
              width: Dimentions.screenWidth,
              child: Container(
                width: Dimentions.screenWidth,
                height: Dimentions.height100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          Get.arguments['img'],
                        ),
                      ),
                      SizedBox(
                        width: Dimentions.width10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: const TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: Dimentions.height5,
                          ),
                          const Text(
                            "Top Level",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: Dimentions.width70,
                        height: Dimentions.height120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFf3fafc)),
                        child: const Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimentions.height280,
              left: 0,
              width: Dimentions.screenWidth,
              height: Dimentions.screenHeight,
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: Dimentions.height200,
              left: 0,
              width: Dimentions.screenWidth,
              height: 265,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: Dimentions.screenWidth,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFfcfffe),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: Offset(0, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            Get.arguments['title'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                      SizedBox(height: Dimentions.height10),
                      Container(
                        width: Dimentions.screenWidth,
                        child: Text(
                          Get.arguments['text'],
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.watch_later, color: Color(0xFF69c5df)),
                              SizedBox(
                                width: Dimentions.width5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Deadline",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['prize'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFfbc33e)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 495,
                left: 25,
                height: 50,
                child: Container(
                  child: RichText(
                      text: TextSpan(
                          text: "Total Participants ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black),
                          children: [
                        TextSpan(
                            text: "(11)",
                            style: TextStyle(color: Color(0xFFfbc33e)))
                      ])),
                )),
            //images
            Stack(children: [
              for (int i = 0; i < images.length; i++)
                Positioned(
                  top: 530,
                  left: (20 + i * 35).toDouble(),
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage(
                              images[i]['img'],
                            ),
                            fit: BoxFit.cover)),
                  ),
                )
            ]),
            //favourite
            Positioned(
                top: 590,
                left: 25,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFfbc33e)),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {
                          fav.favCounter();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add to favorite",
                      style: TextStyle(color: Color(0xFFfbc33e), fontSize: 18),
                    )
                  ],
                ))
            //))
          ],
        ),
      ),
    );
  }
}
