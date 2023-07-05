// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_const_constructors

// import "dart:ffi";

import "package:flutter/material.dart";
import "package:todoapp/components/my_button.dart";

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
     required this.controller,
     required this.onSave,
     required this.onCancel,
     });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 400,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Image.asset("assets/add.png",
            height: 200,),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Write Task Here", label: Text("Add New Task")),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(

                  text: "Save",
                  onPressed: onSave,
                 
                ),
                SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
