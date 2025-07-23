import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
    elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/cb_bg.jpg"),
          fit: BoxFit.cover
          ),
       
        ),
     foregroundDecoration: BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.white.withOpacity(1), // Төменде ақ түске жуық
        Colors.transparent,             // Жоғарғы жақта мөлдір
      ],
      stops: [0.0, 0.2], // Градиенттің таралу аралығы
    ),
     ),
            ),
      
            Text("data"),
          ],
        ),
      ),
    );
  }
}