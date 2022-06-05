import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gloubale/function/get_image_from_gall.dart';
import '../../provider/user_image_regestration_provider.dart';
class userRegestrationImageWidget extends StatelessWidget {
  const userRegestrationImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8 ),
      child: IntrinsicHeight(
        child: Consumer(
          builder:
              (BuildContext context, WidgetRef ref, Widget? child) {
            return Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: ref
                      .watch(userImageViewProvider.state)
                      .state, // NetworkImage(currentUserData.photoURL!),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.teal,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        imgFromGallery().whenComplete(() => null).then((value) {
                          ref.watch(CurrentImageFileProvuder.state).state = value ;
                          ref.watch(userImageViewProvider.state).state =
                              viewImage(
                                  photoFile: value,
                                  cheekUplodedFile: true);
                        });
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
