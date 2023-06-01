import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // colection reference
  final CollectionReference scoreColection =
      FirebaseFirestore.instance.collection("Scores");

  Future updateUserData(String name, bool current, Map<String, int> game1,
      Map<String, int> game2) async {
    return await scoreColection.doc("ScoreID").update({
      name: {"current": current, "game1": game1, "game2": game2}
    });
  }

  Future<Map> getUserData() async {
    await scoreColection
        .doc("ScoreID")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        return data;
      } else {
        print('Document does not exist on the database');
      }
    });
    return {};
  }

  Map get jsonData {
    return {scoreColection.doc("Scores").get(): 1};
  }
}
