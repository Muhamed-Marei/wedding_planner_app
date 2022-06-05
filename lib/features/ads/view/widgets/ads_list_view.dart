import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Style/font_style/fonts_style.dart';
import '../../../../main.dart';
import '../../../../navication/navication.dart';
import '../../../home_screen/view/screens/current_screen.dart';
import '../../viewModel/ads_list_view_vm.dart';
import '../ads_screen.dart';

class AdsListView extends StatelessWidget {
  const AdsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: HomePageTitleStyle(
        title: "افضل العروض فى مدينتك",
      ),
      subtitle: SizedBox(
          height: 90,
          child: Row(
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return IconButton(
                    onPressed: () {
                      mainWidgetRef.watch(currentScreenProvider.state).state =  AdsHomeScreen()  ;
                    },
                    icon: const Text(
                      "الكل",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  );
                },
              ),
              const Expanded(child: AdsListViewModel()),
            ],
          )),
    );
  }
}
