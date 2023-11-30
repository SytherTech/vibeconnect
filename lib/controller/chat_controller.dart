import 'package:flutter/material.dart';

import '../model/chat_model.dart';

class ChatMessageProvider extends ChangeNotifier {
  final List<ChatMessage> _chats = [
    ChatMessage(
        text: 'Hello!',
        messageStatus: msgStatus.seen,
        time: DateTime.now().subtract(Duration(minutes: 5)),
        isSender: true),
    ChatMessage(
        text: 'Hi there!',
        messageStatus: msgStatus.dilivered,
        time: DateTime.now().subtract(Duration(minutes: 4)),
        isSender: false),
    ChatMessage(
        text: 'How are you?',
        messageStatus: msgStatus.seen,
        time: DateTime.now().subtract(Duration(minutes: 3)),
        isSender: false),
    ChatMessage(
        text: 'I\'m doing well, thanks!',
        messageStatus: msgStatus.dilivered,
        time: DateTime.now().subtract(Duration(minutes: 2)),
        isSender: true),
  ];

  List<ChatMessage> get chats => _chats;

  void sendMessage(String message) {
    _chats.add(ChatMessage(
        text: message,
        messageStatus: msgStatus.sent,
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        isSender: true));
    notifyListeners();
  }
}
