// import 'package:flutter/material.dart';
//
// void main() => runApp(TodoApp());
//
// class TodoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TodoList(),
//     );
//   }
// }
//
// class Todo {
//   Todo({required this.name, required this.completed});
//   String name;
//   bool completed;
// }
//
// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => _TodoListState();
// }
//
// class _TodoListState extends State<TodoList> {
//   final List<Todo> _todos = <Todo>[];
//   final TextEditingController _textFieldController = TextEditingController();
//
//   void _addTodoItem(String name) {
//     setState(() {
//       _todos.add(Todo(name: name, completed: false));
//     });
//     _textFieldController.clear();
//   }
//
//   void _handleTodoChange(Todo todo) {
//     setState(() {
//       todo.completed = !todo.completed;
//     });
//   }
//
//   void _deleteTodo(Todo todo) {
//     setState(() {
//       _todos.removeWhere((element) => element.name == todo.name);
//     });
//   }
//
//   Future<void> _displayDialog() async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add a todo'),
//           content: TextField(
//             controller: _textFieldController,
//             decoration: const InputDecoration(hintText: 'Type your todo'),
//             autofocus: true,
//           ),
//           actions: <Widget>[
//             OutlinedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _addTodoItem(_textFieldController.text);
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todo Manager'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         children: _todos.map((Todo todo) {
//           return TodoItem(
//             todo: todo,
//             onTodoChanged: _handleTodoChange,
//             removeTodo: _deleteTodo,
//           );
//         }).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _displayDialog(),
//         tooltip: 'Add a Todo',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class TodoItem extends StatelessWidget {
//   TodoItem({
//     required this.todo,
//     required this.onTodoChanged,
//     required this.removeTodo,
//   }) : super(key: ObjectKey(todo));
//
//   final Todo todo;
//   final void Function(Todo todo) onTodoChanged;
//   final void Function(Todo todo) removeTodo;
//
//   TextStyle? _getTextStyle(bool checked) {
//     if (!checked) return null;
//     return const TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         onTodoChanged(todo);
//       },
//       leading: Checkbox(
//         checkColor: Colors.greenAccent,
//         activeColor: Colors.red,
//         value: todo.completed,
//         onChanged: (bool? value) {
//           onTodoChanged(todo);
//         },
//       ),
//       title: Row(
//         children: <Widget>[
//           Expanded(
//             child: Text(todo.name, style: _getTextStyle(todo.completed)),
//           ),
//           IconButton(
//             iconSize: 30,
//             icon: const Icon(Icons.delete, color: Colors.red),
//             onPressed: () {
//               removeTodo(todo);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }