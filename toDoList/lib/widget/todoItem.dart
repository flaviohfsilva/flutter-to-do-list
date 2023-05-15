import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChanged;
  final onDeletedToDo;

  const ToDoItem ({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeletedToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: btnColor
          ),
          title: Text(
           todo.todoText!,
            style: TextStyle(
                fontSize: 18,
                color: tdBlack,
              decoration: todo.isDone? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            height: 35,
            width: 35,
            // decoration: BoxDecoration(
            //   color: tdRed,
            //   borderRadius: BorderRadius.circular(5),
            // ),
            child: IconButton(
              color: tdRed,
              icon: Icon(Icons.delete_outlined),
              iconSize: 18,
              onPressed: () {
                onDeletedToDo(todo.id);
              },
            ),
          ),
        ),
    );
  }
}
