// ignore_for_file: non_constant_identifier_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Date',
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 27, color: kWhite, fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              totalRepeatCount: 20,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          SizedBox(height: 10),
          Lottie.asset(
            "assets/date.json",
            animate: true,
            height: size.height * 0.4,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Stack(
            children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shadowColor: Colors.blueGrey[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                              padding: const EdgeInsets.only(top:10),
                              child: Text("Date Today",
                                  style: GoogleFonts.redressed(fontSize: 22, color: Colors.indigo)),
                            ),
                          ],
                        ),
                      ),
                       Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                      padding: const EdgeInsets.only(left:8,bottom: 8,top:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LottieContainer(
                              func: () {
                                setState(() {
                                  showDatePicker(
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: Color.fromARGB(255, 201, 22,
                                                      31), // header background color
                                                  onPrimary:
                                                      Colors.black, // header text color
                                                  onSurface: Color.fromARGB(
                                                      255, 0, 0, 0), // body text color
                                                ),
                                                textButtonTheme: TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    primary:
                                                        Colors.red, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                          context: context,
                                          initialDate: today ?? DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2023))
                                      .then((value) {
                                    setState(() {
                                      today = value;
                                      today =
                                          DateFormat.yMMM().format(today!) as DateTime?;
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Current Date",style: GoogleFonts.redressed(fontSize:20,color: Color.fromARGB(255, 0, 0, 0))),
                                SizedBox(height:4),
                                Text(today == null ? "select date" : today.toString(),
                                    style: GoogleFonts.redressed(fontSize: 20, color: Colors.indigo)),
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
              top:3,
              right: 5,
              child: IconButton(
                onPressed: (){
                  setState(() {});
                },
                icon: Icon(Icons.replay_outlined,size:27)
              ),
            ),
            ]
          ),
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
          Stack(
            children: [
              Padding(
              padding: const EdgeInsets.only(left:8,right:8,),
              child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                              padding: const EdgeInsets.only(top:10),
                              child: Text("Date of Plantation",
                                  style: GoogleFonts.redressed(fontSize: 22, color: Colors.indigo)),
                            ),
                          ],
                        ),
                      ),
                       Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                      padding: const EdgeInsets.only(left:8,bottom: 8,top:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LottieContainer(
                              func: () {
                                setState(() {
                                  showDatePicker(
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: Color.fromARGB(255, 201, 22,
                                                      31), // header background color
                                                  onPrimary:
                                                      Colors.black, // header text color
                                                  onSurface: Color.fromARGB(
                                                      255, 0, 0, 0), // body text color
                                                ),
                                                textButtonTheme: TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    primary:
                                                        Colors.red, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                          context: context,
                                          initialDate: today ?? DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2023))
                                      .then((value) {
                                    setState(() {
                                      plantation = value;
                                      plantation =
                                          DateFormat.yMMM().format(today!) as DateTime?;
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Current Date",style: GoogleFonts.redressed(fontSize:20,color: Color.fromARGB(255, 0, 0, 0))),
                                SizedBox(height:4),
                                Text(plantation == null ? "select date" : today.toString(),
                                    style: GoogleFonts.redressed(fontSize: 20, color: Colors.indigo)),
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
              top:3,
              right: 5,
              child: IconButton(
                onPressed: (){
                  setState(() {});
                },
                icon: Icon(Icons.replay_outlined,size:27)
              ),
            ),
            ]
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Crop(value_1: User1(date_plantation: plantation.toString(),date_today: today.toString()) ))));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Lottie.asset("assets/right.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
