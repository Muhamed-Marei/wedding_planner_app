

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../sign_in_provider.dart';

StateProvider<String> userImageLinkProvuder = StateProvider<String>((ref) {
  String imageLink = currentUserData.photoURL != null
      ? currentUserData.photoURL!
      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOc9VDs02ZrmIC7pS3WzBTvXl8UrI3jwAOVQ&usqp=CAU";
  return imageLink;
});

StateProvider CurrentImageFileProvuder = StateProvider((ref) {
  return "" ;
});

StateProvider<ImageProvider> userImageViewProvider =
StateProvider<ImageProvider>((ref) {
  return viewImage(
      imageLink: ref.watch(userImageLinkProvuder.state).state,
      cheekUplodedFile: false);
});


ImageProvider viewImage(
    {XFile? photoFile, String? imageLink, required bool cheekUplodedFile}) {
  late File  imageFile ;
  if(photoFile !=null){
    imageFile = File(photoFile.path);
  }
  if (cheekUplodedFile != false) {
    if (kIsWeb) {
      if (cheekUplodedFile) {
        return NetworkImage(imageFile.path);
      } else {
        return NetworkImage(imageLink!);
      }
    } else {
      if (cheekUplodedFile) {
        return FileImage(
          File(imageFile.path),
        );
      } else {
        return NetworkImage(imageLink!);
      }
    }
  } else {
    return NetworkImage(imageLink!);
  }
}
