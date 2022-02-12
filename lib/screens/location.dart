import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/colors.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Location',
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 27, color: kWhite, fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              // stopPauseOnTap: true,
            ),
          ),
          Lottie.asset(
            "assets/location.json",
            animate: true,
            height: size.height * 0.37,
            width: size.width,
            fit: BoxFit.fill,
          ),
          // SizedBox(height: 5),
          Center(child: Text("Location",style: GoogleFonts.roboto(fontSize: 26, color: kWhite,fontWeight: FontWeight.w600))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Location())));
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
