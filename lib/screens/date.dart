import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:lottie/lottie.dart';
import 'package:space/build/full_container.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 163, 46),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kBlack)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(child: TextConstant(body: "Date")),
          ),
          SizedBox(height: 10),
          Lottie.network(
              "https://assets5.lottiefiles.com/temporary_files/PH5YkW.json",animate : true,height: size.height * 0.5,width: size.width * 0.9),
          Text("name")
        ],
      ),
    );
  }
}
