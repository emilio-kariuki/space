import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:intl/intl.dart';
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
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
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
              "https://assets7.lottiefiles.com/packages/lf20_ytg7s6tx.json",
              animate : true,
              height: size.height * 0.3,
              width: size.width ,
              fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Date Today", style : GoogleFonts.roboto(fontSize: 24,color : kWhite)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LottieContainer(
                  func: (){
                    showDatePicker(
                  context: context,
                  initialDate: date ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2023))
                    .then((value) {
                  setState(() {
                    date = value;
                    date = DateFormat.yMMM().format(date!) as DateTime?;
                  });
                });
                  },
                  lottieUrl: "https://assets7.lottiefiles.com/packages/lf20_ytg7s6tx.json")
              ],
            )
            ),
        ],
      ),
    );
  }
}
