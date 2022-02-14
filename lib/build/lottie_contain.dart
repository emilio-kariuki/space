import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:space/build/build_container.dart';

class LottieContain extends StatelessWidget {
  final String lottieUrl;
  // final Function() func;
  const LottieContain({Key? key, required this.lottieUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: BuildContainer(
          color: Color.fromARGB(255, 61, 78, 87),
          child: Lottie.asset(lottieUrl,height: 500),
        ));
  }
}
