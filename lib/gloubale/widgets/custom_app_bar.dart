import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar = AppBar(
  backgroundColor: Colors.cyan,
  shadowColor: Colors.teal,
  elevation: 15,
  centerTitle: true ,
  title: const Text(
    "Wedding Organizer",
    style:
    TextStyle(fontFamily: "WaterBrush-Regular", color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
  ),
  leading: Image.asset("assets/introduction_screen/intro1.png"),
) ;