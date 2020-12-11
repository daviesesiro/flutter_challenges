import 'dart:math';

import 'package:dating_app/models/person.dart';
import 'package:dating_app/screens/private_chat.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Person> persons = List.generate(
    10,
    (index) => Person(
      'Samanta Russell',
      'this is a message sfasdf asdfasdfd asd a dfasdfa as asd adsf',
      'images/user-${Random().nextInt(3) + 1}.jpg',
      Random().nextInt(3),
    ),
  );

  enterPChat(Person person) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => PrivateChat(person),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          onTap: () => enterPChat(persons[index]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(persons[index].img),
            radius: 38,
          ),
          title: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              persons[index].name,
              style: TextStyle(fontSize: 18),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '09:30AM',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              ),
              if (persons[index].unread > 0)
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Text(
                    persons[index].unread.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  radius: 12,
                ),
            ],
          ),
          subtitle: Text(
            persons[index].lastMessage,
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
