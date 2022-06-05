import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


AutoDisposeStreamProvider<QuerySnapshot<Object?>> weddingHallProvider =
StreamProvider.autoDispose<QuerySnapshot>((ref) =>
    FirebaseFirestore.instance.collection("Wedding_Halls").snapshots());

