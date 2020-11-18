import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  Future<void> addTest(Map testData, String testID) async {
    await FirebaseFirestore.instance
        .collection('Test')
        .doc(testID)
        .set(testData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestion(Map questionData, String testID) async {
    await FirebaseFirestore.instance
        .collection('Test')
        .doc(testID)
        .collection('QNA')
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getTest() async {
    return FirebaseFirestore.instance.collection('Test').snapshots();
  }
}
