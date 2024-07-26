import 'package:flutter/material.dart';
import 'package:flutter_childhood/core/constant/color.dart';

class Message{
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});

  
}
class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final DateTime date;
  const Messages({super.key, required this.isUser, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
width: double.infinity,
padding: const EdgeInsets.all(15),
margin:const EdgeInsets.symmetric(vertical: 15).copyWith(
  left: isUser?100:10,
  right:isUser? 10:100
),
decoration: BoxDecoration(
  color: isUser ? AppColor.terqaz : AppColor.fairuz,
  borderRadius: const BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    topLeft: Radius.circular(10),
  )
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(message, style: const TextStyle(fontSize: 16,color: Colors.white)),
    Text(date.toString(), style:const TextStyle(fontSize: 10,color: Colors.white)),
  ],
),

    );
  }
}