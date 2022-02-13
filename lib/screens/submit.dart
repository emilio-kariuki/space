// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/location.dart';

class Submit extends StatefulWidget {
  final User4 value_4;
  const Submit({Key? key, required this.value_4}) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    print(widget.value_4.date_plantation);
    print(widget.value_4.date_today);
    print(widget.value_4.type);
    print(widget.value_4.variety);
    print(widget.value_4.image);
    print(widget.value_4.x_coordinate);
    print(widget.value_4.y_coordinate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
    );
  }
}
