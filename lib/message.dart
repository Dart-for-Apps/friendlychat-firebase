import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.snapshot, this.animation});
  final DataSnapshot  snapshot;
  final Animation animation;
  @override
  Widget build (BuildContext context) {
    return new FadeTransition(
      opacity: new CurvedAnimation(
        parent: animation, curve: Curves.easeOut,
      ),
      child: new Container (
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        // 아바타 1칸, 이름 및 채팅 1칸 
        child: new Row( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                backgroundImage: 
                  new NetworkImage(snapshot.value['senderPhotoUrl']),
              ),
            ),
            new Expanded(
              child: new Column(
                // 이름 한줄, 채팅 한줄
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(snapshot.value['senderName'], style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: snapshot.value['imageUrl'] != null?
                      new Image.network(snapshot.value['imageUrl'], width: 250.0,):
                      new Text(snapshot.value['text']),
                  )
                ],
              )
            ) 
          ],
        )
      )
    );
  }
}