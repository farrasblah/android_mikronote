import 'package:intl/intl.dart';

class Post {
  final String username;
  final String content;
  final List<String> img_links;
  final DateTime date;
  final String title;
  final String email;
  final String avatar;

  Post({
    required this.username,
    required this.content,
    required this.img_links,
    required this.date,
    required this.title,
    required this.email,
    required this.avatar
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final formatter = DateFormat('M/d/yyyy'); // sesuai format 3/31/2025

    return Post(
      username: json['usn'],
      title: json['title'],
      content: json['caption'],
      img_links: List<String>.from(json['images']),
      date: formatter.parse(json['created_at']),
      email: json['email'],
      avatar: json['avatar']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "date": date,
      "title": title,
      "content": content,
      "img_links": img_links,
      "email": email,
      "avatar": avatar
    };
  }
}
