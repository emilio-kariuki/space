// ignore_for_file: avoid_print, prefer_final_fields, unused_import
import "dart:async";
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  MapController controller = MapController();

  getpermission() {}
  buildMap() {}
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
                  'Location',
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
            "assets/location.json",
            animate: true,
            height: size.height * 0.37,
            width: size.width,
            fit: BoxFit.fill,
          ),
          // SizedBox(height: 5),
          Center(
              child: Text("Location",
                  style: GoogleFonts.roboto(
                      fontSize: 26,
                      color: kWhite,
                      fontWeight: FontWeight.w600))),
          Stack(children: [
            Container(
              child: Center(
                  child: FlutterMap(
                mapController: controller,
                options: MapOptions(center: buildMap(), minZoom: 5.0),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Text("© OpenStreetMap contributors");
                    },
                  ),
                ],
              )),
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: kWhite),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {},
                child: Lottie.asset(
                  "assets/point.json",
                  animate: true,
                  height: size.height * 0.07,
                  width: size.width * 0.17,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ]),
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
                child: Lottie.asset("assets/right.json",
                    width: size.width * 0.2))),
      ),
    );
  }
}
