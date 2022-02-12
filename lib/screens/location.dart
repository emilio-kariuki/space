// ignore_for_file: avoid_print, prefer_final_fields, unused_import, import_of_legacy_library_into_null_safe
import "dart:async";
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:latlong2/latlong.dart" as latLng;

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition initial = CameraPosition(
      zoom: 15.0,
        target: LatLng(-0.39244357411624337, 36.958791836761094));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initial,
            mapType: MapType.satellite
          )
        ],
      )
    );
  }
}
