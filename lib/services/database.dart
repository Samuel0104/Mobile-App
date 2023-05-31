import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? name;
  DatabaseService({this.name});

  // colection reference
  final CollectionReference scoreColection =
      FirebaseFirestore.instance.collection("Scores");

  Future updateUserData(
      bool current, Map<String, int> game1, Map<String, int> game2) async {
    return await scoreColection
        .doc(name)
        .set({"current": current, "game1": game1, game2: game2});
  }
}
