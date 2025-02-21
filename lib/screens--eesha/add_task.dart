//change line 156
import 'package:flutter/material.dart';
import 'package:fyp/screens/home.dart';
class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  String taskTitle = "";
  String selectedDate = "Date not set";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar is different becuase of subpage
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600, // Pink Header
        title: Text(
          "New Task",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Container(
        //whole container contain all widgets
        color: Colors.white, // Light pink background
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title Input
            //written what will be text
            Text(
              "What is to be done?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade800,
              ),
            ),
            SizedBox(height: 10),
            //Here user enters the text
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        taskTitle = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Task Here",
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade300),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    cursorColor: Colors.pink,
                    style: TextStyle(color: Colors.pink.shade800),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.mic, color: Colors.pink.shade600),
              ],
            ),
            SizedBox(height: 30),

            // Due Date Section
            Text(
              "Due date",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade800,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
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
                      setState(() {
                        selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
                      });
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
                color: Colors.pink.shade600,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "No notifications if date not set.",
              style: TextStyle(color: Colors.red,),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),

      // Floating Check Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {print("Task Title: $taskTitle");
          print("Selected Date: $selectedDate");
        },
        backgroundColor: Colors.pink.shade600,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
