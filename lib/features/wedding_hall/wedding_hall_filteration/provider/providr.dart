import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AutoDisposeStreamProvider<QuerySnapshot<Object?>> getFilterType =  StreamProvider.autoDispose<QuerySnapshot>((ref)=>
    FirebaseFirestore.instance.collection("wedding_hold_filter").snapshots()
) ;

