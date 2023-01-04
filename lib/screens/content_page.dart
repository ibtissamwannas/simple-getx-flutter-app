import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/screens/constants/dimentions.dart';

import 'my_detail_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((s) => {
              setState(() {
                list = json.decode(s);
              })
            });
    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((s) => {
              setState(() {
                info = json.decode(s);
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
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            //james smith
            Container(
              width: Dimentions.screenWidth,
              height: Dimentions.height90,
              margin: EdgeInsets.only(
                  left: Dimentions.width20, right: Dimentions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("img/background.jpg"),
                    ),
                    SizedBox(
                      width: Dimentions.width10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "James Smith",
                          style: TextStyle(
                              color: Color(0xFF3b3f42),
                              fontSize: 18,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: Dimentions.height10,
                        ),
                        const Text(
                          "Top Level",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf3fafc)),
                      child: Center(
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
            SizedBox(
              height: 20,
            ),
            //popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Popular Contest",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: Dimentions.width5,
                  ),
                  Container(
                    width: Dimentions.height45,
                    height: Dimentions.width50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimentions.height20,
            ),
            //list
            SizedBox(
              height: Dimentions.height230,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/detail", arguments: {
                          'title': info[i]["title"].toString(),
                          'text': info[i]["text"].toString(),
                          'name': info[i]["name"].toString(),
                          'img': info[i]["img"].toString(),
                          'time': info[i]["time"].toString(),
                          'prize': info[i]["prize"].toString(),
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        height: Dimentions.height220,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: i.isEven
                                ? Color(0xFF69c5df)
                                : Color(0xFF9294cc)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  info[i]["title"],
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Expanded(child: Container())
                              ],
                            ),
                            SizedBox(height: Dimentions.height10),
                            SizedBox(
                              width: Dimentions.screenWidth,
                              child: Text(
                                info[i]["text"],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xFFb8eefc)),
                              ),
                            ),
                            SizedBox(
                              height: Dimentions.height5,
                            ),
                            const Divider(
                              thickness: 1.0,
                            ),
                            Row(children: [
                              for (int i = 0; i < 4; i++)
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(info[i]["img"]),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                            ]),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Dimentions.height20,
            ),
            //recent contests
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: Dimentions.width5,
                  ),
                  Container(
                    width: Dimentions.width50,
                    height: Dimentions.height45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/recent');
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimentions.height20,
            ),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (_, i) {
                          return Container(
                            width: Dimentions.screenWidth,
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFebf8fd),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(list[i]["img"]),
                                  ),
                                  SizedBox(
                                    width: Dimentions.width10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[i]["status"],
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontSize: 15,
                                            decoration: TextDecoration.none),
                                      ),
                                      SizedBox(
                                        height: Dimentions.height5,
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          list[i]["text"],
                                          style: const TextStyle(
                                              color: Color(0xFF3b3f42),
                                              fontSize: 18,
                                              decoration: TextDecoration.none),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimentions.width50,
                                    height: Dimentions.height70,
                                    child: Text(
                                      list[i]["time"],
                                      style: const TextStyle(
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                          color: Color(0xFFb2b8bb)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
