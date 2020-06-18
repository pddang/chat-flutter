import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/screens/chat_screen.dart';


class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: Container(decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )) ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),),
                         child: ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, int index){
                        final Message chat = chats[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              user: chat.sender,),
                              ),
                              ),
                           child: Container(
                            margin: EdgeInsets.only(top:5, bottom: 5, right:20),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: chat.unread ? Color(0xFFFFEFEE):Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)
                            )) ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(radius: 30.0,backgroundImage: AssetImage(chat.sender.imageUrl)),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(chat.sender.name,
                                        style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold) ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          width: MediaQuery.of(context).size.width *0.45,
                                          child: Text(chat.text,
                                          style: TextStyle(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(children: <Widget>[
                                  Text(chat.time,
                                  style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
                                 ),
                                 SizedBox(height: 5.0,),
                                  chat.unread ? Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color:Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text('New', 
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                    ): Text(''),
                                ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  ) ,),
               );
  }
}