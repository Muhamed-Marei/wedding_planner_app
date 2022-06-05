import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../navication/navication.dart';


PreferredSizeWidget SubAppBarWidget({required Widget nextScreenWidget ,required String title}){
  return AppBar(
    leading: Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return IconButton(
          color: Colors.white,
          onPressed: () {
            mainWidgetRef.watch(currentScreenProvider.state).state =
                nextScreenWidget;
          },
          icon: const Icon(Icons.arrow_back),
        );
      },
    ),
    centerTitle: true,
    title: Text("$title",style: TextStyle(color: Colors.white),),
  );
}
