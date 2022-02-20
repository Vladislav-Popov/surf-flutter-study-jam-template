import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatScreen({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Введите ник',
          ),
          cursorColor: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          child: Text('F'),
                        ),
                        title: Text("Текст"),
                        subtitle: Text(
                          "текст2",
                          maxLines: 1,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        hintText: 'Введите текст',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      messageTextController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
