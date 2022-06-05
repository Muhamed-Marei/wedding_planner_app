import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
StateProvider<bool> openbuffet = StateProvider<bool>((ref)=>false);
StateProvider<bool> djProvider = StateProvider<bool>((ref)=>false);
class SwitchButton extends StatelessWidget {
  SwitchButton(
      {Key? key, required this.title, required this.valioProvider , required this.valuo}) {
  }
  late TextEditingController valuo ;
  late String title;
  late StateProvider valioProvider;
  @override
  Widget build(BuildContext context) {
    return  Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Switch(
                  value: ref.watch(valioProvider.state).state,
                  activeColor: Colors.blue,
                  onChanged: (bool state) {
                    valuo.text = state.toString();
                    ref.watch(valioProvider.state).state =
                    !ref.watch(valioProvider.state).state;
                  }),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    color: ref.watch(valioProvider.state).state
                        ? Colors.green
                        : Colors.red),
              ),
            ],
          );
        });
  }
}
