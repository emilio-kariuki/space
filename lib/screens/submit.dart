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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Center(
        child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      //  color: Colors.grey,
                      child: Center(
                        child: widget.value_4.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                  widget.value_4.image!,
                                  width: size.width,
                                  height: size.height * 0.32,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Text("Select Image"),
                      ),
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30), color: kWhite),
                      // image: image
                    ),
                  ),
      ),
    );
  }
}
