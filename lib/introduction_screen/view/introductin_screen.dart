import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../features/home_screen/view/screens/current_screen.dart';
import '../../features/home_screen/view/screens/home_screen_view.dart';
import '../../sign_in/sign_in_provider.dart';
import '../intro_screen_view_model/intro_screen_model.dart';

class IntroductionScreenPag extends StatelessWidget {
  const IntroductionScreenPag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IntroPages(),
    );
  }
}
class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}
class _IntroPagesState extends State<IntroPages> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void goToWelcomeScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return const CurrentScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        pageViewData(
            title: 'Wedding Hall',
            body:
                ' We provide the best way for you to find the right hall and easy way to arrangement your wedding',
            image: 'assets/introduction_screen/intro2.png'),
        pageViewData(
            title: 'Hall',
            body:
                'you will view all wedding hall that compete to provide the best service and cost for you',
            image: 'assets/introduction_screen/intro1.png')
      ],
      onDone: () => goToWelcomeScreen(context),
      onSkip: () => goToWelcomeScreen(context), // You can override onSkip callback
      showSkipButton: true,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amber)),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.pinkAccent,
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amber)),
      curve: Curves.bounceOut,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.amber,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.indigoAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}
