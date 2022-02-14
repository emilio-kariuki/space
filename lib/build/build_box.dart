import "package:flutter/material.dart";

class BuildBox extends StatelessWidget {
  final Widget child;
  final bool click;
  const BuildBox({Key? key, required this.child, required this.click}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      elevation: 9,
      shadowColor: Colors.blueGrey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: const EdgeInsets.all(5),
        height: click ? size.height * 0.06 : size.height * 0.09,
        width: click ? size.width * 0.2 : size.width * 0.17,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey[800],
        ),
        child: child,
      ),
    );
  }
}
