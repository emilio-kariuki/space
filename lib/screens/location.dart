// ignore_for_file: avoid_print, prefer_final_fields, unused_import, import_of_legacy_library_into_null_safe, library_prefixes, non_constant_identifier_names
import "dart:async";
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:space/constants.dart/Text.dart';
import 'package:space/constants.dart/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:geolocator/geolocator.dart';
import 'package:space/screens/image.dart';
import 'package:space/screens/submit.dart';

class User4 {
  String type;
  String variety;
  String date_plantation;
  String date_today;
  File image;
  double x_coordinate;
  double y_coordinate;
  User4(
      {
      required this.x_coordinate,
      required this.y_coordinate,
      required this.image,
      required this.type,
      required this.variety,
      required this.date_plantation,
      required this.date_today});
}

class Location extends StatefulWidget {
  final User3 value_3;
  const Location({Key? key, required this.value_3}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  GoogleMapController? newGoogleMapController;
  double? latitude;
  double? longitude;
  // LatLng ltPosition = LatLng(latitude!, longitude!);
  getPermission() async {
    var locate = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    // print(locate.longitude);
    latitude = locate.latitude;
    longitude = locate.longitude;
  }

  getLocation() {
    getPermission().then((locate) {
      print(longitude);
      print(latitude);
      LatLng ltPosition = LatLng(latitude!, longitude!);
      CameraPosition cameraPosition =
          CameraPosition(target: ltPosition, zoom: 10);
      // ignore: unused_local_variable
      newGoogleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    print(widget.value_3.date_plantation);
    print(widget.value_3.date_today);
    print(widget.value_3.type);
    print(widget.value_3.variety);
    print(widget.value_3.image);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        title: Text("Kenya Space Agency",
            style: GoogleFonts.robotoCondensed(fontSize: 27, color: kWhite)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Lottie.asset(
            "assets/location.json",
            animate: true,
            height: size.height * 0.37,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              //  color: Colors.grey,
              child: Center(
                child: Scaffold(
                  body:GoogleMap(
                    mapType: MapType.hybrid,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      getLocation();
                    },
                  ),
                )
              ),
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: kWhite),
              // image: image
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Submit(value_4: User4(x_coordinate: longitude!, y_coordinate: latitude!, image: widget.value_3.image, type: widget.value_3.type, variety: widget.value_3.variety, date_plantation: widget.value_3.date_plantation, date_today: widget.value_3.date_today)))));
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
