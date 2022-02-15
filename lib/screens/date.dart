// ignore_for_file: non_constant_identifier_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:space/build/build_appBar.dart';
import 'package:space/build/full_container.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/crop.dart';

class User1 {
  String date_plantation;
  String date_today;

  User1({required this.date_plantation, required this.date_today});
}

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final mainKey = GlobalKey<ScaffoldState>();
  DateTime? today;
  DateTime? plantation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: mainKey,
      backgroundColor: Color.fromARGB(255, 36, 47, 53),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                Material(
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 97, 94, 94),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Container(
                      height: size.height * 0.15,
                      width: size.width,
                      decoration: BoxDecoration(
                        // border: Border(bottom: BorderSide(color: Colors.blueGrey![800])),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Expanded(
                        flex : 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 17, bottom: 8, top: 8),
                                    child: BuildBar(
                                      // click: true,
                                      iconUrl: "assets/backward.json",
                                      func: () {
                                        // setState(() {
                                        //   click = !click;
                                        // });
                                        HapticFeedback.lightImpact();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text("Kenya Space Agency",
                                      style: GoogleFonts.redressed(
                                          fontSize: 25, color: Colors.indigo)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 8, top: 8),
                                    child: BuildBar(
                                      iconUrl: "assets/seetings.json",
                                      func: () {
                                        HapticFeedback.lightImpact();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  WavyAnimatedText(
                                    'Date',
                                    textStyle: GoogleFonts.redressed(
                                        fontSize: 29,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w600),
                                    speed: const Duration(milliseconds: 400),
                                  ),
                                ],
                                totalRepeatCount: 100,
                                pause: const Duration(milliseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 3,
                  right: 25,
                  child: Lottie.asset("assets/celebration.json",
                      height: 200.1, width: 100.1, animate: true),
                ),
                Positioned(
                  top: 3,
                  left: 25,
                  child: Lottie.asset("assets/celebration.json",
                      height: 200.1, width: 100.1, animate: true),
                ),
              ]),
              Lottie.asset(
                "assets/calendar_date.json",
                animate: true,
                height: size.height * 0.4,
                width: size.width,
                fit: BoxFit.fill,
              ),
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Material(
                    shadowColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Container(
                      // padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text("Date Today",
                                      style: GoogleFonts.redressed(
                                          fontSize: 22, color: Colors.indigo)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Divider(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      height: 5,
                                      thickness: 0.4,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LottieContainer(
                                      func: () {
                                        HapticFeedback.lightImpact();
                                        setState(() {
                                          showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            ColorScheme.light(
                                                          primary: Color.fromARGB(
                                                              255,
                                                              201,
                                                              22,
                                                              31), // header background color
                                                          onPrimary: Colors
                                                              .black, // header text color
                                                          onSurface: Color.fromARGB(
                                                              255,
                                                              0,
                                                              0,
                                                              0), // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .red, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate:
                                                      today ?? DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2023))
                                              .then((value) {
                                            setState(() {
                                              today = value;
                                              today = DateFormat.yMMM()
                                                  .format(today!) as DateTime?;
                                            });
                                          });
                                        });
                                      },
                                      lottieUrl: "assets/icon.json"),
                                  SizedBox(width: size.width * 0.13),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Current Date",
                                            style: GoogleFonts.redressed(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0))),
                                        SizedBox(height: 4),
                                        Text(
                                            today == null
                                                ? "select date"
                                                : today.toString(),
                                            style: GoogleFonts.redressed(
                                                fontSize: 19,
                                                color: Colors.indigo)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          // CirclePro
                        });
                      },
                      icon: Icon(Icons.replay_outlined, size: 27)),
                ),
              ]),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 8,
                    right: 8,
                  ),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    shadowColor: Colors.blueGrey[800],
                    child: Container(
                      // padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text("Date of Plantation",
                                      style: GoogleFonts.redressed(
                                          fontSize: 22, color: Colors.indigo)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Divider(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      height: 5,
                                      thickness: 0.4,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LottieContainer(
                                      func: () {
                                        HapticFeedback.lightImpact();
                                        setState(() {
                                          showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            ColorScheme.light(
                                                          primary: Color.fromARGB(
                                                              255,
                                                              201,
                                                              22,
                                                              31), // header background color
                                                          onPrimary: Colors
                                                              .black, // header text color
                                                          onSurface: Color.fromARGB(
                                                              255,
                                                              0,
                                                              0,
                                                              0), // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .red, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate:
                                                      today ?? DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2023))
                                              .then((value) {
                                            setState(() {
                                              plantation = value;
                                              plantation = DateFormat.yMMM()
                                                  .format(today!) as DateTime?;
                                            });
                                          });
                                        });
                                      },
                                      lottieUrl: "assets/icon.json"),
                                  SizedBox(width: size.width * 0.13),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Current Date",
                                            style: GoogleFonts.redressed(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0))),
                                        SizedBox(height: 4),
                                        Text(
                                            plantation == null
                                                ? "select date"
                                                : today.toString(),
                                            style: GoogleFonts.redressed(
                                                fontSize: 19,
                                                color: Colors.indigo)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.replay_outlined, size: 27)),
                ),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          HapticFeedback.vibrate();
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => Crop(
                  value_1: User1(
                      date_plantation: plantation.toString(),
                      date_today: today.toString())))));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                // padding: const EdgeInsets.all(5),
                child:
                    Lottie.asset("assets/next.json", width: size.width * 0.3))),
      ),
    );
  }
}
