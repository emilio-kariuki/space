import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constants.dart/colors.dart';

class TextConstant extends StatelessWidget {
  final String body;
  const TextConstant({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(body, style: GoogleFonts.roboto(fontSize: 36, color: kBlack,fontWeight: FontWeight.w600));
  }
}
