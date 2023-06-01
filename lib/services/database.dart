import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // colection reference
  final CollectionReference scoreCollection =
      FirebaseFirestore.instance.collection("Scores");

  Future<void> updateUserData(String name, bool current,
      Map<String, dynamic> game1, Map<String, dynamic> game2) async {
    await scoreCollection.doc("ScoreID").update({
      name: {"current": current, "game1": game1, "game2": game2}
    });
  }

  Future getUserData() async {
    late Object? data;
    await scoreCollection
        .doc("ScoreID")
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        data = documentSnapshot.data();
      }
    });
    return data;
  }
}
