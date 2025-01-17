// import 'package:flutter/material.dart';
// import 'chat_bot_script.dart'; // Import lớp ChatBotScript
//
// class ChatBotPage extends StatefulWidget {
//   const ChatBotPage({super.key});
//
//   @override
//   State<ChatBotPage> createState() => _ChatBotPageState();
// }
//
// class _ChatBotPageState extends State<ChatBotPage> {
//   final ChatBotScript chatBotScript = ChatBotScript(); // Khởi tạo ChatBotScript
//   final TextEditingController _inputController = TextEditingController();
//   final List<String> _messages = [];
//
//   void _sendMessage() {
//     final input = _inputController.text.trim();
//     if (input.isNotEmpty) {
//       setState(() {
//         _messages.add('You: $input');
//         final response = chatBotScript.getResponse(input);
//         _messages.add('Bot: $response');
//         _inputController.clear();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChatBot'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _inputController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
