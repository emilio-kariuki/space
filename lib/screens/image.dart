// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:space/screens/crop.dart';
import 'package:image_picker/image_picker.dart';

class Picture extends StatefulWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  File? image;
  ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
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
                  'Image',
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
          Lottie.network(
            "https://assets5.lottiefiles.com/packages/lf20_knv0iktv.json",
            animate: true,
            height: size.height * 0.4,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    child: Center(
                      child: image == null
                          ? Text("No image selected")
                          : Image.file(image!, height: 120, width: 120),
                    ),
                    height: size.height * 0.3,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), color: kWhite),
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Container(
                                width: size.width,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
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
                                        leading: Icon(Icons.camera),
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
                                        leading: Icon(Icons.layers),
                                        title: Text("Gallery"),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Crop())));
        },
        tooltip: "Next Page",
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_Nce4dJ/forward_02.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
