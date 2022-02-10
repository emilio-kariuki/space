import "package:flutter/material.dart";

class BuildContainer extends StatelessWidget {
  final Widget child;
  const BuildContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: child

    );
  }
}
