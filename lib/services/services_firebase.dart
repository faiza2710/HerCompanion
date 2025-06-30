import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseService {
  final CollectionReference servicesCollection =
  FirebaseFirestore.instance.collection('services');

  // Function to save service details to Firestore
  Future<void> saveService(String title, String description, String mobile) async {
    try {
      User? user = FirebaseAuth.instance.currentUser; // 🔹 Current logged-in user
      if (user == null) throw "User not logged in"; // 🔹 Handle unauthenticated users

      await servicesCollection.add({
        'title': title,
        'description': description,
        'mobile': mobile,
        'userId': user.uid, // 🔹 Save user UID
        'timestamp': FieldValue.serverTimestamp(), // 🔹 For sorting by time
      });

      print("✅ Service Saved Successfully in Firestore!");
    } catch (e) {
      print("❌ Error saving service: $e");
      throw e;
    }
  }

  // Function to get all services from Firestore
  Stream<QuerySnapshot> getServices() {
    return servicesCollection.orderBy('timestamp', descending: true).snapshots();
  }
  // Function to get only current user's services
  Stream<QuerySnapshot> getUserServices() {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("❌ User is NULL!");
        return Stream.empty();
      }

      return FirebaseFirestore.instance
          .collection('services')
          .where('userId', isEqualTo: user.uid)
          .orderBy('timestamp', descending: true)
          .snapshots();
    } catch (e) {
      print("❌ Error fetching user services: $e");
      return Stream.empty();
    }
  }



  // Function to delete a service
  Future<void> deleteService(String docId) async {
    try {
      await servicesCollection.doc(docId).delete();
      print("✅ Service Deleted Successfully!");
    } catch (e) {
      print("❌ Error deleting service: $e");
      throw e;
    }
  }
}

