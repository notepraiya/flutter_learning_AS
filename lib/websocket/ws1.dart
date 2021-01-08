//https://flutter.dev/docs/cookbook/networking/web-sockets

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Ws1 extends StatefulWidget {
  final String title;

  // final WebSocketChannel channel;
  // Ws1({Key key, @required this.title, @required this.channel}) : super(key: key);

  final WebSocketChannel channel =
      IOWebSocketChannel.connect('wss://echo.websocket.org');

  Ws1({Key key, @required this.title}) : super(key: key);

  @override
  _Ws1State createState() => _Ws1State();
}

class _Ws1State extends State<Ws1> {
  TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: FloatingActionButton(
                onPressed: _sendMessage,
                tooltip: 'Send message',
                child: Icon(Icons.send),
              ),
            ),
          ),
          StreamBuilder(
            stream: widget.channel.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
              );
            },
          )
        ],
      ),
    );
  }
}
