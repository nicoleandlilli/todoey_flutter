
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {

  @override
  _TaskScreenState createState() => _TaskScreenState();

}

class _TaskScreenState extends State<TaskScreen> {

  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  AddTaskScreen((newTaskTitle){
                    setState(() {
                      tasks.add(Task(name: newTaskTitle));
                    });
                    Navigator.pop(context);
                  }
                  ).build(context)
          );
          // showModalBottomSheet(context: context, builder: (context) => Container());
        },

        child: Icon(Icons.add),
        shape: CircleBorder(),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0,left: 30.0,right: 30.0,bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child:Icon(Icons.list,size: 30.0,),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
            ),
            child: TaskList(tasks),
          )),
        ],


      ),
    );
  }



}



