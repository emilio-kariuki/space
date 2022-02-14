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
      backgroundColor: Color.fromARGB(255, 36, 47, 53),
        body: Column(
          children: [
            Center(
              child: Material(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: size.width,
                  
                  child: Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          
                          'Submit',
                          textStyle: GoogleFonts.robotoCondensed(
                              fontSize: 27, color: Colors.indigo, fontWeight: FontWeight.w400),
                              
                          speed: const Duration(milliseconds: 400),
                        ),
                      ],
                      totalRepeatCount: 20,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      // stopPauseOnTap: true,
                    ),
                            ),
                  ),
                ),
              ),
            ),
          ],
        ),
        );
  }
}
