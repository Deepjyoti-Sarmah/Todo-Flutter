import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widgets/counter.dart';
import 'package:todoapp/widgets/new_todo.dart';
import 'package:todoapp/widgets/todo_cards.dart';
import 'package:todoapp/widgets/todo_list.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [
    // Todo(id: Uuid(), title: "Clean Room", completed: false),
    // Todo(id: Uuid(), title: "Pet the Cat", completed: true),
    // Todo(id: Uuid(), title: "Dance", completed: true)
  ];

  void _updateTodoCompletion(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTodo(addTodo: _addTodo);
        });
  }

  void _addTodo(String todo) {
    setState(() {
      todos.add(Todo(id: Uuid(), title: todo, completed: false));
    });
  }

  int _calcTotalCompletion() {
    var totalCompletions = 0;

    todos.forEach((todo) {
      if (todo.completed) {
        totalCompletions++;
      }
    });

    return totalCompletions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Counter(
            numberofTodos: todos.length,
            totalCompletions: _calcTotalCompletion(),
          ),
          TodoList(
            todos: todos,
            updateTodoCompletions: _updateTodoCompletion,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
