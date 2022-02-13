import "package:flutter/material.dart";
import 'package:space/build/build_box.dart';


class BuildBar extends StatelessWidget {
  final String iconUrl;
  final Function() func;
  const BuildBar({Key? key, required this.iconUrl, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: func,
        child: BuildBox(
          child: Image.asset(iconUrl),
        ),
      ),
    );
  }
}