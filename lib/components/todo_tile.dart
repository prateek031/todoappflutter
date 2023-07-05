// ignore_for_file: prefer_const_constructors, must_be_immutable

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TodoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  State<TodoTile> createState() => _TodoTileState();

  static toDoList() {}
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Slidable(
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(255, 255, 75, 62),
            borderRadius: BorderRadius.circular(13),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 208, 207, 207),
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            children: [
              Checkbox(
                value: widget.taskCompleted,
                onChanged: widget.onChanged,
                activeColor: Color.fromARGB(255, 81, 80, 80),
              ),
              Text(
                widget.taskName,
                style: TextStyle(
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
