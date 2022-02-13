import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constants.dart/colors.dart';


class Submit extends StatefulWidget {
  const Submit({Key? key}) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
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