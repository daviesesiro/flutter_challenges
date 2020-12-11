import 'dart:math';

import 'package:dating_app/models/person.dart';
import 'package:flutter/material.dart';

class PrivateChat extends StatelessWidget {
  final Person person;
  const PrivateChat(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  MessageItem(person: person),
                  MessageItem(person: person),
                  MessageItem(person: person, isMine: true)
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: TextField(
                style: TextStyle(fontSize: 18),
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  prefixIcon: Transform.rotate(
                    angle: pi / 3,
                    child: buildMessageButton(icon: Icons.attachment_outlined),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildMessageButton(icon: Icons.emoji_emotions_outlined),
                      buildMessageButton(
                          icon: Icons.send_outlined,
                          color: Theme.of(context).accentColor),
                    ],
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Enter Message",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlatButton buildMessageButton({
    Color color,
    Function onPressed,
    IconData icon,
  }) {
    return FlatButton(
      minWidth: double.minPositive,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(500),
      ),
      child: Icon(
        icon,
        color: color == null ? Colors.grey : color,
      ),
      onPressed: () {},
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({Key key, @required this.person, this.isMine = false})
      : super(key: key);

  final Person person;

  final bool isMine;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMine)
            Transform.translate(
              offset: Offset(0, -15),
              child: CircleAvatar(
                backgroundImage: AssetImage(person.img),
                radius: 25,
              ),
            ),
          if (!isMine)
            SizedBox(
              width: 20,
            ),
          Column(
            crossAxisAlignment:
                isMine ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: !isMine
                      ? Theme.of(context).accentColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight:
                        isMine ? Radius.circular(0) : Radius.circular(25),
                    bottomLeft:
                        isMine ? Radius.circular(25) : Radius.circular(0),
                    topLeft: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(15),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  "${person.lastMessage}",
                  style: TextStyle(
                    fontSize: 18,
                    color: isMine ? Colors.black : Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("00:46",
                  textAlign: isMine ? TextAlign.left : TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                  ))
            ],
          ),
          if (isMine)
            SizedBox(
              width: 20,
            ),
          if (isMine)
            Transform.translate(
              offset: Offset(0, -15),
              child: CircleAvatar(
                backgroundImage: AssetImage(person.img),
                radius: 25,
              ),
            ),
        ],
      ),
    );
  }
}
