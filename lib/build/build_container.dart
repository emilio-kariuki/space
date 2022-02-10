import "package:flutter/material.dart";

class BuildContainer extends StatelessWidget {
  final Widget child;
  const BuildContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.98,
      width: size.width * 0.98,
      padding: const EdgeInsets.all(4), child: child);
  }
}
