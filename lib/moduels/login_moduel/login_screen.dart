import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orange,
          ) ,
          Center(
            child: Container(
              color: Colors.white.withOpacity(.5),
              width: 300,
              height: 300,
            ),
          ) ,
        ],
      ),
    );
  }
}
