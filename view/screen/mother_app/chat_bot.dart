import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/view/screen/mother_app/message.dart';

class MotherChatBot extends StatefulWidget {
  const MotherChatBot({super.key});

  @override
  State<MotherChatBot> createState() => _MotherChatBotState();
}

class _MotherChatBotState extends State<MotherChatBot> {
  TextEditingController userInput=TextEditingController();
  //final apikey=""

  final List<Message> _messages=[];

  Future <void> talkWithAI() async{
    final userMsg=userInput.text;
    setState(() {
      _messages.add(Message(message: userMsg,isUser: true,date: DateTime.now()));
    });
// !communicaton with generateModel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(itemCount: _messages.length,itemBuilder: (context,index){
                final message=_messages[index];
                return Messages(isUser: message.isUser, message: message.message, date: DateTime.now());
              
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex: 15,
                    child: TextFormField(
style:const TextStyle(color: Colors.white) ,
controller: userInput,
decoration: InputDecoration(
  border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(15),
    
  ),
  label:const Text("Enter Your Message")
),

                    )),
                   const Spacer(),
                    IconButton(
                      padding: EdgeInsets.all(12),
                      iconSize: 30,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColor.terqaz),
                        foregroundColor: MaterialStateProperty.all(AppColor.fairuz),
                        shape: MaterialStateProperty.all(const CircleBorder())
                      ),
                      onPressed: (){
// ! create function call api
// talkWithAI()
                      },
                      icon: const Icon(Icons.send),
                    )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}