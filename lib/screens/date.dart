import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:space/constants.dart/colors.dart';

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kenya Space Agency",style: GoogleFonts.robotoCondensed(fontSize: 27,color: kBlack)),
      ),
    );
  }
}
