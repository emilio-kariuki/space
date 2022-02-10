import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constants.dart/colors.dart';

class Picture extends StatefulWidget {
  Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
            elevation: 0,
      ),
      body: Column(
        children: [
          Text("Image"),
        ],
      ),
    );
  }
}