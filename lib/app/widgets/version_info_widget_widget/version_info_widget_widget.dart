import 'package:flutter/material.dart';
import 'package:flutter_sign_up_in_with_firebase/config.dart';

class VersionInfoWidgetWidget extends StatelessWidget {
  const VersionInfoWidgetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: const [
          Text(
            'Version',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            APP_VERSION,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      )
    );
  }
}
