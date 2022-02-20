import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/message.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

class ChatModel extends ChangeNotifier {
  final ChatRepository _chatRepository;

  ChatModel({required chatRepository}) : _chatRepository = chatRepository {}

  List<ChatMessageDto> _messages = [];
  List<ChatMessageDto> get messages => List.unmodifiable(_messages);

  void updateMessage() async {
    _messages = await _chatRepository.messages;
    notifyListeners();
  }
}
