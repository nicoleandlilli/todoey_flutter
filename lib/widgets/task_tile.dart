import 'package:flutter/material.dart';

// class TaskTile extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//           'This is a task'
//       ),
//       trailing: TaskCheckbox(),
//     );
//   }
// }

class TaskTile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TaskTileState();
  }
}


class TaskTileState extends State {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          'This is a task',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
      ),
      trailing: TaskCheckbox(isChecked),
    );
  }
}

class TaskCheckbox extends StatelessWidget{

  final bool checkboxState;

  TaskCheckbox(this.checkboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: (bool? newValue) {
        // setState(() {
        //   isChecked = newValue!;
        // });
      },
    );
  }
}