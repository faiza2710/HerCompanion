import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'package:fyp/screens/add_task.dart';
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Placeholder for task list (replace with Firebase in the future)
  List<Map<String, dynamic>> tasks = [
    {"title": "Cleaning", "isChecked": false},
    {"title": "Groceries", "isChecked": false},
  ];

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index); // Remove task from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              // Task List Section
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Checkbox(
                            value: tasks[index]["isChecked"],
                            onChanged: (bool? value) {
                              setState(() {
                                tasks[index]["isChecked"] = value!;
                              });
                            },
                            fillColor: MaterialStateProperty.all(Colors.white), // White background
                            checkColor: Colors.pink, // Pink tick when checked
                            side: BorderSide.none, // Removes black border
                          ),
                          Text(
                            tasks[index]["title"],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Quick Task Input Section
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.mic, color: Colors.pink.shade600),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Quick Task Here",
                          hintStyle: TextStyle(color: Colors.pink),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink), // Default pink underline
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2), // Thicker pink underline when focused
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              )


            ],
          ),

          // Floating Action Button Positioned
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                // Action for adding a new task
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskPage()));
              },
              backgroundColor: Colors.pink,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
