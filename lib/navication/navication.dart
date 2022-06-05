
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/home_screen/view/screens/home_screen_view.dart';
import '../features/open_buffet/view/screen/open_buffet_screen.dart';
import '../features/profile.dart';

StateProvider  currentScreenProvider =
StateProvider((ref){
  return root[ref.watch(selectedScreenProvider.state).state]
  ["screen"]   ;
});

StateProvider selectedScreenProvider =
StateProvider<int>((ref){
  return 1 ;
});
List<Widget> screensIconList = [
  const Icon(Icons.shopping_basket),
  const Icon(Icons.home, size: 30),
  const Icon(Icons.perm_identity),
];
List<Map<String, dynamic>> root = [
  {
    "title": "prodact",
    "screen":   OpenBuffetScreen( userId: '',),
    "icon": const Icon(Icons.shopping_basket)
  },
  {
    "title": "Service",
    "screen": const HomeScreen(),
    "icon": const Icon(Icons.home_filled)
  },
  {
    "title": "portfolio",
    "screen": const ProfileHomePage(),
    "icon": const Icon(Icons.perm_identity)
  },

];
