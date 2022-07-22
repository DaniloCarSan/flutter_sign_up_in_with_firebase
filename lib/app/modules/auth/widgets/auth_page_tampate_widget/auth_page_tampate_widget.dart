import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPageTemplateWidget extends StatelessWidget {

  final Widget child;

  const AuthPageTemplateWidget({Key? key, required this.child}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor:Colors.blue,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300,
            ]
          )
        ),
        child: this.child
      ),
    );
  }
}