import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/screens/inherited_notifier.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = ChatModelProvider.watch(context)?.model;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: model?.setName,
          decoration: InputDecoration.collapsed(
            hintText: 'Введите ник',
          ),
          cursorColor: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: model?.updateMessage, icon: const Icon(Icons.refresh)),
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
                        title: Text(model?.messages[index].author.name ?? ''),
                        subtitle: Text(
                          model?.messages[index].message ?? '',
                          maxLines: 1,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: model?.messages.length ?? 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: model?.messageTextController,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        hintText: 'Введите текст',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: model?.sendMessage,
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
