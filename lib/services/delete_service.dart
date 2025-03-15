import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/services/services_firebase.dart';

class DeleteService extends StatefulWidget {
  const DeleteService({super.key});

  @override
  State<DeleteService> createState() => _DeleteServiceState();
}

class _DeleteServiceState extends State<DeleteService> {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete My Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder(
        stream: firebaseService.getUserServices(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print("❌ Firestore Error: ${snapshot.error}");
              return Center(child: Text("❌ Error: ${snapshot.error}"));
            }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No services found!", style: TextStyle(fontSize: 18)),
            );
          }

          final userServices = snapshot.data!.docs;

          return ListView.builder(
            itemCount: userServices.length,
            itemBuilder: (context, index) {
              final service = userServices[index];

              // Check if document has required fields
              if (!service.data().toString().contains('title') ||
                  !service.data().toString().contains('description')) {
                return Center(child: Text("❌ Invalid Data Structure!"));
              }

              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    service['title'] ?? "No Title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(service['description'] ?? "No Description"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await firebaseService.deleteService(service.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Service Deleted")),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),

    );
  }
}
