import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int numberofTodos;
  final int totalCompletions;

  Counter({required this.numberofTodos, required this.totalCompletions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Text(
        "${totalCompletions}/${numberofTodos}",
        style: TextStyle(
            fontSize: 75,
            color: totalCompletions == numberofTodos
                ? Colors.green
                : Colors.black),
      ),
    );
  }
}
