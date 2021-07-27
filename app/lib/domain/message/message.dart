import 'dart:math';

import 'package:app/domain/user/usersList.dart';

class Message {
  final String message;
  final String receiver;
  final DateTime dateTime;
  final bool isSender;

  Message(
      {this.message,  this.receiver, this.dateTime, this.isSender});
}

List<Message> messagesList = [
  Message(
    receiver: usersList[0],
    message: "Hey, I saw some of your answers on MySchool, I found them pretty Amazing",
    dateTime: DateTime.now().subtract(Duration(minutes: 20000)),
    isSender: false,

  ),
  Message(
    receiver: usersList[0],
    message: "Wow thank you so much",
    dateTime: DateTime.now().subtract(Duration(minutes: 2000)),
    isSender: true,

  ),
  Message(
    receiver: usersList[0],
    message: "Welcome, and how are you?",
    dateTime: DateTime.now().subtract(Duration(minutes: 200)),
    isSender: false,

  ),
  Message(
    receiver: usersList[0],
    message: "Tell me how you are and where you live?",
    dateTime: DateTime.now().subtract(Duration(minutes: 20)),
    isSender: false,

  ),
];
