import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:fyp/components/notice.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/notice.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
String? userId = currentUser?.uid;

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final CollectionReference tasksCollection = FirebaseFirestore.instance.collection('Todo');
  String taskTitle = "";
  String taskmesg = "";
  String selectedDate = "Date not set";
  String selectedTime = "Time not set";

  void _addTask() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    if (taskTitle.isNotEmpty && taskmesg.isNotEmpty) {
      tasksCollection.add({
        "title": taskTitle,
        "message": taskmesg,
        "isChecked": false,
        "userId": currentUser.uid,
      }).then((value) => Navigator.pop(context));

      List<String> timeParts = selectedTime.split(":");
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);
      List<String> dateParts = selectedDate.split("-");
      int year = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int day = int.parse(dateParts[2]);
      _requestPermissions();
      int uniqueId = Random().nextInt(100000);
      DateTime selectedDateTime = DateTime(year, month, day, hour, minute);
      NotificationHelper().ScheduleNotification(uniqueId, taskTitle, taskmesg, selectedDateTime);
    }
  }

  void _requestPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
    if (await Permission.notification.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("New Task", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What is to be done?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) => setState(() => taskTitle = value),
                      decoration: InputDecoration(
                        hintText: "Enter Task Here!!!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink, width: 2),
                        ),
                      ),
                      cursorColor: Colors.pink,
                      style: TextStyle(color: Colors.pink.shade800),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What is Message for Notification?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) => setState(() => taskmesg = value),
                      decoration: InputDecoration(
                        hintText: "Enter Message here!!!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink, width: 2),
                        ),
                      ),
                      cursorColor: Colors.pink,
                      style: TextStyle(color: Colors.pink.shade800),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Due Date",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedDate, style: TextStyle(fontSize: 16, color: Colors.black)),
                        IconButton(
                          icon: Icon(Icons.calendar_today, color: Colors.pink),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() => selectedDate = "${pickedDate.toLocal()}".split(' ')[0]);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Due Time",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedTime, style: TextStyle(fontSize: 16, color: Colors.black)),
                        IconButton(
                          icon: Icon(Icons.access_time, color: Colors.pink),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                  child: child!,
                                );
                              },
                            );
                            if (pickedTime != null) {
                              setState(() => selectedTime = "${pickedTime.hour}:${pickedTime.minute}");
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notifications",
                      style: TextStyle(fontSize: 14, color: Colors.pink.shade800, decoration: TextDecoration.underline)),
                  SizedBox(height: 5),
                  Text("You will not get any notification if date is not set",
                      style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.pink.shade600,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
