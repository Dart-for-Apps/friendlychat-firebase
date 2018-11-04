import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController, this.photoUrl, this.name});
  final String text;
  final AnimationController animationController; 
  final String photoUrl;
  final String name;
  @override
  Widget build (BuildContext context) {
    return new FadeTransition(
      opacity: new CurvedAnimation(
        parent: animationController.view, curve: Curves.easeOut,
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
                  new NetworkImage(photoUrl),
              ),
            ),
            new Expanded(
              child: new Column(
                // 이름 한줄, 채팅 한줄
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
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