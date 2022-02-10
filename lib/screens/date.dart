import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:space/constants.dart/Text.dart';
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
        backgroundColor: const Color.fromARGB(255, 41, 223, 47),
        title: Text("Kenya Space Agency",style: GoogleFonts.robotoCondensed(fontSize: 27,color: kBlack)),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(child: TextConstant(body: "Date")),
          )
        ],
      ),
    );
  }
}
