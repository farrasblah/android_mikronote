import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  // Daftar notifikasi
  final List<Map<String, String>> notifications = [
    {
      'title': 'Pemberitahuan',
      'subtitle': 'Seseorang menyebutmu dalam sebuah komentar.'
    },
    {
      'title': 'Suka Postinganmu',
      'subtitle': 'Seseorang menyukai postinganmu.'
    },
    {
      'title': 'Komentar Baru',
      'subtitle': 'Seseorang mengomentari postinganmu.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text(notif['title']!),
            subtitle: Text(notif['subtitle']!),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              print("Notifikasi '${notif['title']}' ditekan");
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
