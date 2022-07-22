import 'package:flutter/material.dart';

class InputShadow extends StatelessWidget {
  final Widget child;

  const InputShadow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: this.child,
    );
  }
}
