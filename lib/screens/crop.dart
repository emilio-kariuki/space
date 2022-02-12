import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/Text.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/location.dart';

class Crop extends StatefulWidget {
  Crop({Key? key}) : super(key: key);

  @override
  State<Crop> createState() => _CropState();
}

class _CropState extends State<Crop> {
  List<String> items = [
    'Emilio',
    "Kariuki",
    "Gichuru",
    "Jane",
    "Rosie",
    "Joy",
    "Kennedy",
    "Peter",
    "Rachel"
  ];
  List<String> itemz = [
    'Emilio',
    "Kariuki",
    "Gichuru",
    "Jane",
    "Rosie",
    "Joy",
    "Kennedy",
    "Peter",
    "Rachel"
  ];

  String? selectedType;
  String? selectedVariety;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Plant',
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 27, color: kWhite, fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              // stopPauseOnTap: true,
            ),
          ),
          Lottie.asset(
            "assets/plant.json",
            animate: true,
            height: size.height * 0.37,
            width: size.width,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(child: Text("Plants",style: GoogleFonts.roboto(fontSize: 26, color: kWhite,fontWeight: FontWeight.w600))),
          ),
          Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 38,
                        )),
                  ),
                ],
              ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text("Type",style: GoogleFonts.roboto(fontSize: 26, color: kWhite,fontWeight: FontWeight.w600)),
              ),
              SizedBox(width: size.width * 0.13),
              DropdownButton2(
                value: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                    print(selectedType);
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 18,
                iconEnabledColor: Color.fromARGB(255, 209, 160, 0),
                iconDisabledColor: Color.fromARGB(255, 255, 255, 255),
                buttonHeight: size.height * 0.06,
                buttonWidth: size.width * 0.65,
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.roboto(fontSize: 16, color: Colors.blueGrey[800],fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 52, 70, 78),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                buttonElevation: 0,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 234, 234),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text("Variety",style: GoogleFonts.roboto(fontSize: 26, color: kWhite,fontWeight: FontWeight.w600)),
              ),
              SizedBox(width: size.width * 0.07),
              DropdownButton2(
                value: selectedVariety,
                onChanged: (value) {
                  setState(() {
                    selectedVariety = value as String;
                    print(selectedVariety);
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 18,
                iconEnabledColor: Color.fromARGB(255, 216, 166, 3),
                iconDisabledColor: Color.fromARGB(255, 255, 255, 255),
                buttonHeight: size.height * 0.06,
                buttonWidth: size.width * 0.65,
                items: itemz
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.roboto(fontSize: 16, color: Colors.blueGrey[800],fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 52, 70, 78),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                buttonElevation: 0,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 234, 234),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Location())));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Lottie.asset(
                    "assets/right.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
