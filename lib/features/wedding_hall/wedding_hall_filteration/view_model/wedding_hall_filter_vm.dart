import 'dart:core';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class WeddingHallFilterVM extends StatefulWidget {
 late TextEditingController initValio ;
   WeddingHallFilterVM({Key? key,required this.initValio}) : super(key: key);

  @override
  State<WeddingHallFilterVM> createState() => _WeddingHallFilterVMState();
}

class _WeddingHallFilterVMState extends State<WeddingHallFilterVM> {
String initVal ="Cairo" ;
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("city").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              } else {
                return ListTile(
                  title: Text("sellect the country "),
                  subtitle:  Container(
                    width: 50,
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: DropdownButton<String>(
                          icon:Icon(Icons.location_on ),
                          menuMaxHeight: 200,
                          value: initVal,
                          elevation: 10,
                          alignment: FractionalOffset.center,
                          iconEnabledColor: Colors.cyanAccent,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          hint: Text("city"),
                          dropdownColor: Colors.grey,
                          onChanged: (String? newValue) {
                            setState(() {
                              widget.initValio.text = newValue!;
                              initVal = newValue;

                            });
                          },
                          items: dropdownMenuItem(snapshot: snapshot),
                        ),
                      ),
                    ),
                  ),

                );
              }
            },
          );
        });
  }
}

List<DropdownMenuItem<String>> dropdownMenuItem(
    {required AsyncSnapshot<QuerySnapshot> snapshot}) {
  List<DropdownMenuItem<String>> listDropdownMenuItem = [];
  for (var v in snapshot.data!.docs) {
    listDropdownMenuItem.add(
        DropdownMenuItem<String>(
          alignment: FractionalOffset.center,
      value: v["city"],
      child: Text(
        v["city"],
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ));
  }

  return listDropdownMenuItem;
}
