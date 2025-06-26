import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView.separated(
        itemCount: 12,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text("Notification ${index+1}"),
            subtitle: Text("Ini notifikasi indeks ke ${index+1}"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: (){
              print("notif ke ${index+1} ditekan");
            },
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[200],
          thickness: 1,
          height: 1,
        ),
      ),
    );
  }
}
