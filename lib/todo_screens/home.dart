import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/todo_screens/add_task.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
String? userId = currentUser?.uid;

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
        stream: tasksCollection.where("userId", isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty, color: Colors.pink, size: 60),
                  SizedBox(height: 10),
                  Text(
                    "No tasks added yet!",
                    style: TextStyle(fontSize: 18, color: Colors.pink.shade600),
                  ),
                ],
              ),
            );
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
                      value: task["isChecked"] ?? false,
                      onChanged: (value) => _toggleTaskCompletion(task.id, task["isChecked"] ?? false),
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

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.pink,
      flexibleSpace: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To Do List',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Icon placeholder (optional)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
