import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_planner_app/splashScreen/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding organizer',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        shadowColor: Colors.cyan,
      ),
      home: SafeArea(child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          mainWidgetRef = ref;
          return ref.watch(mainHomeScreenProvider.state).state;
        },
      )),
    );
  }
}

StateProvider<Widget> mainHomeScreenProvider =
    StateProvider<Widget>((ref) => SplashScreen());
late WidgetRef mainWidgetRef;



