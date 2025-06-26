import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("New Post"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                hintText: "What are you thinking about",
                border: InputBorder.none
            ),
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Terkirim");
        },
        backgroundColor: Colors.red[400],
        child: Icon(Icons.send, color: Colors.grey[50],),
      ),
    );
  }
}
