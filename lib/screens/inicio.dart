import 'dart:async';
import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/registro'),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'PayUs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
