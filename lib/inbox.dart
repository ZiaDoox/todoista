import 'package:app/appBarTitle.dart';
import 'package:app/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class InboxWidget extends StatefulWidget {
  @override
  _InboxWidgetState createState() => _InboxWidgetState();
}

class _InboxWidgetState extends State<InboxWidget> {
  List<Widget> tasks = [];

  List<UnicornButton> _getInboxMenu() {
    List<UnicornButton> children = [];

    //Add children here
    children.add(_inboxOption(iconData: Icons.note_add, onPressed: () {
      addTask();
    }));
    children.add(_inboxOption(iconData: Icons.settings, onPressed: () {

    }));
    return children;
  }

  void addTask() {
    setState(() {
      tasks.add(Task());
    });    
  }

  

  Widget _inboxOption({IconData iconData, Function onPressed}) {
    return UnicornButton(
      currentButton: FloatingActionButton(
        backgroundColor: Colors.red,
        mini: true,
        child: Icon(iconData),
        onPressed: onPressed,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    
    // TODO: this function should search the database for tasks and return them
    // TODO: this should be placed in the body of the scaffold instead of the Task() Widget
    List<Widget> _getTasks() {
      return tasks;

    }
    

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(pageTitle: 'Inbox',),)
      ,
      body: Center(child: Column(children: _getTasks(),),),
      
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showMenu(),
      ),*/

      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.red,
        parentButton: Icon(Icons.add),
        childButtons: _getInboxMenu(),
      ),
    );
  }
}