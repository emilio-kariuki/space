// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_field

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:space/build/build_appBar.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/location.dart';
import "dart:async";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_storage/firebase_storage.dart";
import 'package:permission_handler/permission_handler.dart';

class Submit extends StatefulWidget {
  final User4 value_4;
  const Submit({Key? key, required this.value_4}) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  // uploadImage() async {
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   // final _imagePicker = ImagePicker();
  //   // PickedFile image;
  //   //Check Permissions
  //   await Permission.photos.request();

  //   var permissionStatus = await Permission.photos.status;

  //   if (permissionStatus.isGranted){
  //     //Select Image
  //      var file = File(widget.value_4.image.path);
  //     if (widget.value_4.image != null){
  //       //Upload to Firebase
  //       var snapshot = await _firebaseStorage.ref()
  //       .child('images/imageName')
  //       .putFile(file).onComplete;
  //       var downloadUrl = await snapshot.ref.getDownloadURL();
  //       setState(() {
  //         imageUrl = downloadUrl;
  //       });
  //     } else {
  //       print('No Image Path Received');
  //     }
  //   } else {
  //     print('Permission not granted. Try Again with permission access');
  //   }
  // }

  final Completer<GoogleMapController> _controller = Completer();
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
      backgroundColor: Color.fromARGB(255, 36, 47, 53),
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
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
                      // border: Border(bottom: BorderSide(color: Colors.blueGrey![800])),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 17, bottom: 8, top: 8),
                                child: BuildBar(
                                  iconUrl: "assets/backward.json",
                                  func: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Text("Kenya Space Agency",
                                  style: GoogleFonts.redressed(
                                      fontSize: 25, color: Colors.indigo)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 8, top: 8),
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
                                  'Submit',
                                  textStyle: GoogleFonts.redressed(
                                      fontSize: 29,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w600),
                                  speed: const Duration(milliseconds: 400),
                                ),
                              ],
                              totalRepeatCount: 100,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 3,
                right: 25,
                child: Lottie.asset("assets/celebration.json",
                    height: 200.1, width: 100.1, animate: true),
              ),
              Positioned(
                top: 3,
                left: 25,
                child: Lottie.asset("assets/celebration.json",
                    height: 200.1, width: 100.1, animate: true),
              ),
            ]),
            Lottie.asset(
              "assets/wow.json",
              animate: true,
              height: size.height * 0.45,
              width: size.width,
              fit: BoxFit.fill,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.067,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: GoogleFonts.redressed(
                        fontSize: 40,
                        color: kWhite,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
