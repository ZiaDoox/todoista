import 'package:app/taskCompletedButton.dart';
import 'package:app/task_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() =>  _TaskState();
}

class _TaskState extends State<Task> {
  final _textEditingController = TextEditingController();
  bool textTapped = false;
  String taskTitle = '';

  BoxDecoration myBoxDecoration() {  // this just adds the border of the whole task widget
    return BoxDecoration(
      border: Border.all(width: 0.1),
    );
  }



  @override
  Widget build(BuildContext context) {

    Widget _taskTitleInputLabel() { // The input field widget
      return Container(
            padding: EdgeInsets.only(left: 7, top: 1, bottom: 1),
            
            child: TextField(
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.black, fontSize: 20),
              onSubmitted: (text) {
                setState(() {
                  taskTitle = text;
                  textTapped = false;
                });
              },
              controller: _textEditingController,
              decoration: InputDecoration.collapsed(hintText: 'Enter task title'),
            ));
    }


    Widget _determineTextFieldOrText() {
      print(taskTitle);
      if(taskTitle == '') return _taskTitleInputLabel();
      if (textTapped == true) { // If we tap the title we should be able to change it
        return _taskTitleInputLabel();
      } else {
        if(taskTitle == '' || taskTitle == null) { // if we don't provide a title we shouldn't be able to submit it
          textTapped = true;  
          return _taskTitleInputLabel(); // So we just return the input label again
        } else { // else we submit it
        return 
        Container(
          padding: EdgeInsets.all(11),
          child: Text(_textEditingController.text, style: TextStyle(fontSize: 20),)
        );
        }
      }
    }

    return Container(
      decoration: myBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CheckedButton(),
          Expanded(
              child: Container(
                width: 100,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (textTapped == false) {
                        textTapped = true;
                      } else {
                        textTapped = false;
                      }
                    });
                    _textEditingController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _textEditingController.text.length));
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.1), left: BorderSide(width: 0.1))),
                    child: _determineTextFieldOrText(),)
                ),
              )),
          TaskDueDate(),
        ],
      ),
    );
  }
}
