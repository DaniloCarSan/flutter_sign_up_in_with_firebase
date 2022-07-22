import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {

  final double padding;

  const LogoWidget({Key? key, this.padding = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: const FlutterLogo(
        style: FlutterLogoStyle.horizontal,
        size: 60,
      ),
    );
  }
}
