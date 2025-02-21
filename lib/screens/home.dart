import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/appbar.dart';
import 'package:fyp/screens/add_task.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final CollectionReference tasksCollection = FirebaseFirestore.instance.collection('Todo');

  void _toggleTaskCompletion(String docId, bool currentStatus) {
    tasksCollection.doc(docId).update({'isChecked': !currentStatus});
  }

  void _deleteTask(String docId) {
    tasksCollection.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: StreamBuilder(
        stream: tasksCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("No tasks available"));
          }

          var tasks = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
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
                      value: (task.data() as Map<String, dynamic>).containsKey("isChecked")
                          ? task["isChecked"]
                          : false,
                      onChanged: (value) => _toggleTaskCompletion(
                          task.id,
                          (task.data() as Map<String, dynamic>).containsKey("isChecked")
                              ? task["isChecked"]
                              : false),
                      fillColor: MaterialStateProperty.all(Colors.white),
                      checkColor: Colors.pink,
                    ),


                    Expanded(
                      child: Text(
                        task["title"],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () => _deleteTask(task.id),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskPage()));
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

