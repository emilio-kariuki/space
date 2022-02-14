// ignore_for_file: deprecated_member_use, avoid_print, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/Text.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space/screens/crop.dart';
import 'package:space/screens/location.dart';

class User3 {
  String type;
  String variety;
  String date_plantation;
  String date_today;
  File image;

  User3(
      {
      required this.image,
      required this.type,
      required this.variety,
      required this.date_plantation,
      required this.date_today});
}

class Picture extends StatefulWidget {
  final User2 value_2;
  const Picture({Key? key, required this.value_2}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  File? image;
  ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    try {
      if (image == null) return;

      final imageTempo = File(image.path);
      setState(() {
        this.image = imageTempo;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.value_2.date_plantation);
    print(widget.value_2.date_today);
    print(widget.value_2.type);
    print(widget.value_2.variety);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 47, 53),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    'Image',
                    textStyle: GoogleFonts.robotoCondensed(
                        fontSize: 27, color: kWhite, fontWeight: FontWeight.w600),
                    speed: const Duration(milliseconds: 400),
                  ),
                ],
                totalRepeatCount: 20,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                // stopPauseOnTap: true,
              ),
            ),
            Lottie.asset(
              "assets/welcome.json",
              animate: true,
              height: size.height * 0.37,
              width: size.width,
              fit: BoxFit.fill,
            ),
            TextConstant(body: "Take Picture"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      //  color: Colors.grey,
                      child: Center(
                        child: image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                  image!,
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
                  Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                          onPressed: () {
                            // takePhoto(ImageSource.camera);
                            setState(() {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                  width: size.width,
                                  height: size.height * 0.2,
                                  decoration: BoxDecoration(
                                    //border: Border.all(color: Color.fromARGB(255, 182, 36, 116),width:1 ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.all(5),
                                    title: const Text('choose image from: '),
                                    content: SingleChildScrollView(
                                      child: ListBody(children: [
                                        ListTile(
                                          selectedColor: Colors.grey,
                                          onTap: () {
                                            takePhoto(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          leading: Icon(Icons.camera,
                                              color: Colors.blueGrey[900]),
                                          title: Text("Camera"),
                                        ),
                                        ListTile(
                                          selectedColor: Colors.grey,
                                          onTap: () {
                                            setState(() {
                                              takePhoto(ImageSource.gallery);
                                              Navigator.pop(context);
                                            });
                                          },
                                          leading: Icon(Icons.layers,
                                              color: Colors.blueGrey[900]),
                                          title: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  takePhoto(ImageSource.gallery);
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Text("Gallery")),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Location(value_3: User3(image: image!, type: widget.value_2.type, variety: widget.value_2.variety, date_plantation: widget.value_2.date_plantation, date_today: widget.value_2.date_today)))));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Lottie.asset("assets/right.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
