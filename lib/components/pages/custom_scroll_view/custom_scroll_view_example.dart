import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
  body: CustomScrollView(
    slivers: [
           SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cb_bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        Text(
                          "TEXT TITLE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.more_vert, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      SliverToBoxAdapter(
        child: Container(
          height: 1000,
          color: Colors.cyan,
          padding: const EdgeInsets.all(16),
          child: Text("data", style: TextStyle(fontSize: 24)),
        ),
      ),
    ],
  ),
);
  }
}