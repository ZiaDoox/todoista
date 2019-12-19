import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TaskDueDate extends StatefulWidget {
  @override
  _TaskDueDateState createState() => _TaskDueDateState();
}

class _TaskDueDateState extends State<TaskDueDate> {

  DateTime _dueDate = DateTime.now(); 

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030));
    if(picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: InkWell(
        child: Text(DateFormat("MM-dd").format(_dueDate)),
        onTap: () {
          _selectDate(context);
        },
      )
      
    );
  }
}