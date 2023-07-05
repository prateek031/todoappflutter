// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:todoapp/components/todo_tile.dart";
import "package:todoapp/components/dialog_box.dart";
// import "package:todoapp/components/my_button.dart";



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [];

  
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 44, 39, 39),
        appBar: AppBar(
           backgroundColor: Colors.amber[300],
          title: Text("Todo List",
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 2.0,
          ),),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add,
          size: 30.0,),
        ),
        
        body:
        Padding(
          padding: const EdgeInsets.fromLTRB(1.0,1.0,1.0,0.0),
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            },
          ),
        ));
  }


  
}
