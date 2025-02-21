import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ Firestore me Todo Add karne ka function
  Future<void> addTodo(String title, String date) async {
    try {
      await _db.collection('Todo').add({
        'title': title,
        'date': date,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding todo: $e");
    }
  }

  // ✅ Firestore se Todos fetch karne ka function
  Stream<QuerySnapshot> getTodos() {
    return _db.collection('Todo').orderBy('timestamp', descending: true).snapshots();
  }
}
