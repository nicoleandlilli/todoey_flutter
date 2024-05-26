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
  bool isChecked = true;
  void checkboxCallback(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          'This is a task',
              style: TextStyle(
                decoration: isChecked?TextDecoration.lineThrough:null,
              ),
      ),
      trailing: TaskCheckbox(checkboxState:isChecked,toggleCheckboxState:checkboxCallback),
    );
  }
}

class TaskCheckbox extends StatelessWidget{

  final bool checkboxState;
  final void Function(bool?) toggleCheckboxState;

  TaskCheckbox({required this.checkboxState,required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged:toggleCheckboxState,
    );
  }
}