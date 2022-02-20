import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/message.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

class ChatModel extends ChangeNotifier {
  final messageTextController = TextEditingController();
  final ChatRepository _chatRepository;

  ChatModel({required chatRepository}) : _chatRepository = chatRepository {}

  List<ChatMessageDto> _messages = [];
  List<ChatMessageDto> get messages => List.unmodifiable(_messages);

  String _name = '';
  String get name => _name;

  void updateMessage() async {
    _messages = await _chatRepository.messages;
    notifyListeners();
  }

  void sendMessage() async {
    if (messageTextController.text.isNotEmpty) {
      await _chatRepository.sendMessage(name, messageTextController.text);

      messageTextController.clear();
      updateMessage();
    }
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
