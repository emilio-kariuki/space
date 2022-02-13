// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constants.dart/colors.dart';

class TextConstant extends StatelessWidget {
  final String body;
  const TextConstant({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(body, style: GoogleFonts.roboto(fontSize: 26, color: kWhite,fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
