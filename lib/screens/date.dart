import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:space/build/full_container.dart';
import 'package:space/constants.dart/Text.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/crop.dart';

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final mainKey = GlobalKey<ScaffoldState>();
  DateTime? date;
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Crop',
                textStyle: GoogleFonts.robotoCondensed(
                    fontSize: 27, color: kWhite, fontWeight: FontWeight.w600),
                speed: const Duration(milliseconds: 400),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          SizedBox(height: 10),
          Lottie.network(
            "https://assets7.lottiefiles.com/packages/lf20_ytg7s6tx.json",
            animate: true,
            height: size.height * 0.4,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Date Today",
                    style: GoogleFonts.roboto(fontSize: 24, color: kWhite)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 5),
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
                              initialDate: date ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2023))
                          .then((value) {
                        setState(() {
                          date = value;
                          date = DateFormat.yMMM().format(date!) as DateTime?;
                        });
                      });
                      });
                    },
                    lottieUrl:
                        "https://assets10.lottiefiles.com/packages/lf20_dAHzdX.json"),
                SizedBox(width: size.width * 0.13),
                GestureDetector(
                  onTap: (){
                    setState(() {
                    });
                  },
                  child: Text(
                      date == null ? "input a number" : date.toString(),
                      style: GoogleFonts.roboto(fontSize: 24, color: kWhite)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Date of Plantation",
                    style: GoogleFonts.roboto(fontSize: 24, color: kWhite)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LottieContainer(
                    func: () {
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
                              initialDate: date ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2023))
                          .then((value) {
                        setState(() {
                          date = value;
                          date = DateFormat.yMMM().format(date!) as DateTime?;
                        });
                      });
                    },
                    lottieUrl:
                        "https://assets10.lottiefiles.com/packages/lf20_dAHzdX.json"),
                SizedBox(width: size.width * 0.13),
                Text(date == null ? "input a number" : date.toString(),
                    style: GoogleFonts.roboto(fontSize: 24, color: kWhite)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Crop())));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_Nce4dJ/forward_02.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
