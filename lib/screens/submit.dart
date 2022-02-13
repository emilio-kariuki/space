// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/location.dart';
import "dart:async";

class Submit extends StatefulWidget {
  final User4 value_4;
  const Submit({Key? key, required this.value_4}) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    print(widget.value_4.date_plantation);
    print(widget.value_4.date_today);
    print(widget.value_4.type);
    print(widget.value_4.variety);
    print(widget.value_4.image);
    print(widget.value_4.x_coordinate);
    print(widget.value_4.y_coordinate);
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
            Center(
              child: Container(
                width: size.width,
                color: kBlack,
                child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Submit',
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
              ),
            ),
          ],
        ),
        );
  }
}
