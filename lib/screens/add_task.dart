//change line 156
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final CollectionReference tasksCollection = FirebaseFirestore.instance.collection('Todo');
  String taskTitle = "";
  String selectedDate = "Date not set";

  void _addTask() {
    if (taskTitle.isNotEmpty) {
      tasksCollection.add({
        "title": taskTitle,
        "isChecked": false,
        "date": selectedDate,
      }).then((value) => Navigator.pop(context));
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What is to be done?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => setState(() => taskTitle = value),
              decoration: InputDecoration(
                hintText: "Enter Task Here",
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink.shade300)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
              ),
              cursorColor: Colors.pink,
              style: TextStyle(color: Colors.pink.shade800),
            ),

            SizedBox(height: 30),
            Text("Due date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink.shade800)),
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
              style: TextStyle(color: Colors.red.shade800,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
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

