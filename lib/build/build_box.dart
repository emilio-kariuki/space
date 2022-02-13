import "package:flutter/material.dart";

class BuildBox extends StatelessWidget {
  final Widget child;
  const BuildBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      elevation: 9,
      shadowColor: Colors.blueGrey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: size.height * 0.06,
        width: size.width * 0.17,
        decoration : BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 216, 169, 13)
        ),child: child,
      ),
    );
  }
}
