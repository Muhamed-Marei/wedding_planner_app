import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wedding_planner_app/sign_in/user_regestration/view/screen/regestration_user_screen.dart';
import '../features/home_screen/view/screens/current_screen.dart';
import '../main.dart';


late User currentUserData;

CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('usersData');
Future signInWithGoogleWeb() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });
  await FirebaseAuth.instance.signInWithPopup(googleProvider).whenComplete(() => null).then((value){
    currentUserData = value.user!;
  }) ;
  isNewUser();

}
Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance
      .signInWithCredential(credential)
      .whenComplete(() => null)
      .then((value) {
    currentUserData = value.user!;
  });

  //  Once signed in, cheek if new user
  isNewUser();
}

isNewUser() async {
  usersCollection
      .doc(currentUserData.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    if (documentSnapshot.exists) {
      mainWidgetRef.watch(mainHomeScreenProvider.state).state =
          const CurrentScreen();
    } else {
      mainWidgetRef.watch(mainHomeScreenProvider.state).state =
          RegistrationScreen();
    }
  });
}
