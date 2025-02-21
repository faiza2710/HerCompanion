import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';

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
                        color: Colors.pink.shade600,
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
                            activeColor: Colors.transparent, // Transparent background for the checkbox
                            checkColor: Colors.white, // White tick when checked
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
                color: Colors.pink.shade600,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.mic, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Quick Task Here",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),

          // Floating Action Button Positioned
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                // Action for adding a new task
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewTaskPage()));
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
