enum msgStatus { sent, dilivered, seen }

class ChatMessage {
  final String text;
  msgStatus messageStatus;
  final DateTime time;
  final bool isSender;

  ChatMessage(
      {required this.text,
      required this.messageStatus,
      required this.time,
      required this.isSender});
}
