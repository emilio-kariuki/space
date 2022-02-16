import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/build/build_appBar.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 47, 53),
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            
                            // SizedBox(width: 100),
                            Text("Kenya Space Agency",
                                style: GoogleFonts.redressed(
                                    fontSize: 26, color: Colors.indigo)),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              'Crop',
                              textStyle: GoogleFonts.redressed(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w600),
                              speed: const Duration(milliseconds: 400),
                            ),
                          ],
                          totalRepeatCount: 50,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ],
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
        ],
      ),
    ));
  }
}
