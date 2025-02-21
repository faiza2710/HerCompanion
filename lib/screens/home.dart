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
                        color: Colors.pink.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          // Square Bullet for Task
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: tasks[index]["isChecked"] ? Colors.green : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          // Task Title
                          Expanded(
                            child: Text(
                              tasks[index]["title"],
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),

                          // Delete Icon
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              _deleteTask(index); // Delete the task when pressed
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Floating Action Button Positioned
          Positioned(
            bottom: 40,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
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
