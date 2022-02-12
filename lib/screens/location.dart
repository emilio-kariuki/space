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
import 'package:geolocator/geolocator.dart';
import 'package:space/screens/image.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  GoogleMapController? newGoogleMapController;
  double latitude = 37.42796133580664;
  double longitude = -122.085749655962;
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
      LatLng ltPosition = LatLng(latitude, longitude);
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 189, 139, 31),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Picture())));
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
