import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fyp/components/notice.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
String? userId = currentUser?.uid; // Logged-in user's UID

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
  // && selectedDate != "Date not set" && selectedTime != "Time not set"
  void _addTask() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print("No user logged in");
      return;
    }
      if (taskTitle.isNotEmpty && taskmesg.isNotEmpty) {
      tasksCollection.add({
        "title": taskTitle,
        "message":taskmesg,
        "isChecked": false,
        "userId": currentUser.uid,  // Add logged-in user's UID
        // "date": selectedDate,
        // "time": selectedTime,
      }).then((value) => Navigator.pop(context));

      List<String> timeParts = selectedTime.split(":");
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);
      List<String> dateParts = selectedDate.split("-");
      int year = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int day = int.parse(dateParts[2]);
      _requestPermissions();
      int uniqueId = Random().nextInt(100000); // Generate a random ID
      DateTime selectedDateTime = DateTime(year, month, day, hour, minute);
      NotificationHelper().ScheduleNotification(uniqueId,taskTitle, taskmesg, selectedDateTime);
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
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("New Task", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What is to be done?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) => setState(() => taskTitle = value),
                decoration: InputDecoration(
                  hintText: "Enter Task Here!!!",
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink.shade300)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                ),
                cursorColor: Colors.pink,
                style: TextStyle(color: Colors.pink.shade800),
              ),
              SizedBox(height: 30),
              Text("What is Message for Notification?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) => setState(() => taskmesg = value),
                decoration: InputDecoration(
                  hintText: "Enter Message here!!!",
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink.shade300)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                ),
                cursorColor: Colors.pink,
                style: TextStyle(color: Colors.pink.shade800),
              ),
              SizedBox(height: 30),
              Text("Due date??", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedDate, style: TextStyle(color: Colors.black, fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.pink.shade600),
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
              SizedBox(height: 30),
              Text("Due Time??", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedTime, style: TextStyle(color: Colors.black, fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.access_time, color: Colors.pink.shade600),
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
              SizedBox(height: 10),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.pink.shade800,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "You will not get any notification if date is not set",
                style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
            ],
          ),
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