import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';


class TaskList extends StatefulWidget {

  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();

}


class _TaskListState extends State<TaskList> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context,index){
          return TaskTile(
            taskTitle:  widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: ( checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },

            longPressCallback: (){
              setState(() {
                widget.tasks.removeAt(index);
              });

            },
          );
        }
    );
    // return ListView(
    //   children: <Widget>[
    //     TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone,),
    //     TaskTile(taskTitle: tasks[1].name, isChecked: tasks[0].isDone,),
    //     TaskTile(taskTitle: tasks[2].name, isChecked: tasks[0].isDone,),
    //   ],
    // );
  }

}