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

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final void Function()? longPressCallback;

  TaskTile({required this.isChecked, required this.taskTitle,required this.checkboxCallback,required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
              style: TextStyle(
                decoration: isChecked?TextDecoration.lineThrough:null,
              ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged:(newValue){
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
