import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../gloubale/widgets/custom_app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../../../../navication/navication.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar,
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            currentScreenRef = ref ;
            return ref.watch(currentScreenProvider.state).state;
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
late WidgetRef currentScreenRef;