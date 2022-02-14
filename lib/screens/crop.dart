// ignore_for_file: avoid_print

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/build/build_appBar.dart';
import 'package:space/build/full_container.dart';
import 'package:space/build/lottie_contain.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/date.dart';
import 'package:space/screens/image.dart';

class User2 {
  String type;
  String variety;
  String date_plantation;
  String date_today;

  User2({required this.type, required this.variety,required this.date_plantation, required this.date_today});
}

class Crop extends StatefulWidget {
  final User1 value_1;
  const Crop({Key? key, required this.value_1}) : super(key: key);

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

  String ?selectedType;
  String ?selectedVariety;

  @override
  Widget build(BuildContext context) {
    print(widget.value_1.date_plantation);
    print(widget.value_1.date_today);
    final size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 36, 47, 53),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
                children: [
                  Material(
                elevation: 20,
                  shadowColor: Color.fromARGB(255, 97, 94, 94),
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:17,bottom:8,top: 8),
                              child: GestureDetector(
                                onTap:()=> Navigator.pop(context),
                                child: BuildBar(
                                  iconUrl: "assets/backward.json",
                                  func: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text("Kenya Space Agency",style: GoogleFonts.redressed(fontSize:25,color: Colors.indigo)),
                            Padding(
                              padding: const EdgeInsets.only(left:20,bottom:8,top: 8),
                              child: BuildBar(
                                iconUrl: "assets/seetings.json",
                                func: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                'Crop',
                                textStyle: GoogleFonts.redressed(
                                    fontSize: 29,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 400),
                              ),
                            ],
                            totalRepeatCount: 50,
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                      ],
                    ),
                  )),
                  Positioned(
                    top: 3,
                    right: 25,
                    child: Lottie.asset("assets/celebration.json",height:200.1,width: 100.1,animate:true),
                  ),
                  Positioned(
                    top: 3,
                    left: 25,
                    child: Lottie.asset("assets/celebration.json",height:200.1,width: 100.1,animate:true),
                  ),
                ]
              ),
              // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: SvgPicture.asset(
                  "assets/svg/signup.svg",
                  // animate: true,
                  height: size.height * 0.37,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                  child: Text("Plants",
                      style: GoogleFonts.roboto(
                          fontSize: 26,
                          color: kWhite,
                          fontWeight: FontWeight.w600))),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Date Today",
                                    style: GoogleFonts.redressed(
                                        fontSize: 22, color: Colors.indigo)),
                              ),
                            ],
                          ),
                        ),
                         Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Divider(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        height: 5,
                                        thickness: 0.4,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                LottieContain(lottieUrl: "assets/select.json"),
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
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      color: Colors.blueGrey[800],
                                                      fontWeight: FontWeight.w600),
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
                                  ],
                                ),
                              ),
                            ),
            ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Text("Variety",
                                    style: GoogleFonts.roboto(
                                        fontSize: 26,
                                        color: kWhite,
                                        fontWeight: FontWeight.w600)),
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
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.blueGrey[800],
                                                fontWeight: FontWeight.w600),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) =>Picture(value_2: User2(type: selectedType!, variety: selectedVariety!, date_plantation: widget.value_1.date_plantation, date_today: widget.value_1.date_today)))));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                // padding: const EdgeInsets.all(5),
                child: Lottie.asset("assets/next.json",
                    width: size.width * 0.3))),
      ),
    );
  }
}
