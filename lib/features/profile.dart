import 'package:flutter/material.dart';

import '../sign_in/sign_in_provider.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.cyanAccent,
                    child: Image.network(
                      currentUserData.photoURL!,
                      fit: BoxFit.fill,
                    )),
                Column(
                  children: [
                    Text("${currentUserData.displayName!}"),
                    Text("${currentUserData.email!}")
                  ],
                ),
              ],
            ),
            ListTile(
              title: Text(
                "Reserved Services",
                style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
