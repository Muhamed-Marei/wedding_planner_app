import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../gloubale/data.dart';
import '../../../../sign_in/sign_in_provider.dart';
import '../../../ads/view/widgets/ads_list_view.dart';
import '../../../wedding_hall/view/widgets/favorite_hall_home_list_view.dart';
import '../../../our_service/view_components/view/widgets/our_service_gridl_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        Expanded(child: OurServiceGridlView()),
      ],
    );
  }
}

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Text("${currentUserData.email}");
        },
      ),
    );
  }
}
//currentUserProvider
