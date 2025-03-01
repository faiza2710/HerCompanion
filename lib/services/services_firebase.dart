import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference servicesCollection =
  FirebaseFirestore.instance.collection('services');

  // Function to save service details to Firestore
  Future<void> saveService(String title, String description, String mobile) async {
    try {
      await servicesCollection.add({
        'title': title,
        'description': description,
        'mobile': mobile,
        'timestamp': FieldValue.serverTimestamp(), // For sorting by time
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

