import 'package:chat_app/chatmessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{

  final TextEditingController _textcontroller = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  void _handlesubmitted(String text){
    _textcontroller.clear();
    ChatMessage message = new ChatMessage(
      text
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textcomposerwidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.green),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textcontroller,
                onSubmitted: _handlesubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(onPressed: ()=> _handlesubmitted(_textcontroller.text), icon: new Icon (Icons.send)),
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Column(
      children: [
        new Flexible(child: new ListView.builder(
          itemBuilder: (_,int index) => _messages[index],
          itemCount: _messages.length,
          padding: new EdgeInsets.all(8.0),
          reverse: true,)
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textcomposerwidget(),
        )
      ],
    );
  }
}