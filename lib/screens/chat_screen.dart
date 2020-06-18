import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe){
    return Container(
      margin: isMe ? 
      EdgeInsets.only(top: 8, bottom: 8, left:80):EdgeInsets.only(top: 8, bottom: 8, right:80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.time,style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w600),),
          SizedBox(height: 8,),
          Text(message.text,style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe ? BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0)
      ): BorderRadius.only(
        topRight: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0)),
      ));
  
  }

  _buildMessageComposer(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.photo),iconSize: 25, color: Theme.of(context).primaryColor,onPressed: () {
            
          },),
          Expanded(child: TextField(textCapitalization: TextCapitalization.sentences,decoration: InputDecoration.collapsed(hintText: 'Send a message...'),onChanged: (value) {
            
          },),),
          IconButton(icon: Icon(Icons.send),iconSize: 25, color: Theme.of(context).primaryColor,onPressed: () {
            
          }),
        ],
      )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text(widget.user.name), actions: <Widget>[
        IconButton(icon: Icon(Icons.more_horiz),iconSize: 30, color: Colors.white,onPressed: (){},)
      ],
      elevation: 0,),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
          children: <Widget>[
            Expanded(
                        child: Container(decoration: BoxDecoration
              (color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
                            child: ListView.builder(
                              reverse: true,
                              padding: EdgeInsets.only(top:15),
                              itemCount: messages.length, 
                itemBuilder: (BuildContext context, int index){
                  final Message  message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                }),
              ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}