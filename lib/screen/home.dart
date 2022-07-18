import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> ImageSvg = [
    'assets/Images/pizza.svg',
    'assets/Images/sandwich.svg',
    'assets/Images/salad.svg',
    'assets/Images/drink.svg',
    'assets/Images/pizza.svg',
    'assets/Images/sandwich.svg',
    'assets/Images/salad.svg',
    'assets/Images/drink.svg',
    'assets/Images/pizza.svg',
    'assets/Images/sandwich.svg',
    'assets/Images/salad.svg',
    'assets/Images/drink.svg',
    'assets/Images/sandwich.svg',
    'assets/Images/salad.svg',
    'assets/Images/drink.svg',
  ];
  List<String> ImageName = [
    'pizza',
    'sandwich',
    'salad',
    'drink',
    'pizza',
    'hamburger',
    'salad',
    'drink',
    'pizza',
    'chiken burger',
    'salad',
    'drink',
    'pizza',
    'sandwich',
    'salad'
  ];
  List<String> ImageFood = [
    'assets/Food/food1.png',
    'assets/Food/food2.png',
    'assets/Food/food3.png',
    'assets/Food/food4.png',
    'assets/Food/food5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(backgroundColor: Colors.grey),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .07),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Food",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                    Text(
                      "Fast Delivery",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: Material(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              print(index);
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  ImageSvg[index],
                                  height: 70,
                                  width: 70,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Text(ImageName[index],
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.lato().fontFamily,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .04,
                        left: MediaQuery.of(context).size.width * .05),
                    child: Text("Popular now",
                        style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        5,
                        (index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 25,
                                        right: 15,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .08,
                                        bottom: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(0, 6),
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    height: 200,
                                    width: 170,
                                    child: Column(
                                      children: [
                                        Padding(
                                          child: Text(
                                            ImageName[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: GoogleFonts.lato()
                                                    .fontFamily,
                                                fontSize: 20),
                                          ),
                                          padding: EdgeInsets.only(
                                              top: 100,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .03,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .01,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .02),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "\$68 ",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.lato()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .02),
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  child: Icon(Icons.minimize),
                                                ),
                                                Text("0"),
                                                Container(
                                                    child: Icon(Icons.add))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 10,
                                              color: Colors.grey[400]!,
                                            )
                                          ]),
                                      child: Image.asset(
                                        ImageFood[index],
                                        height: 150,
                                        width: 150,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
