import 'package:flutter/cupertino.dart';

import 'chat_model.dart';

class ChatModelProvider extends InheritedNotifier {
  final ChatModel model;

  ChatModelProvider({Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

  static ChatModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChatModelProvider>();
  }

  static ChatModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChatModelProvider>()
        ?.widget;

    return widget is ChatModelProvider ? widget : null;
  }
}
