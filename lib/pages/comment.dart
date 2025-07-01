import 'package:flutter/material.dart';

class CommentBottomSheet extends StatelessWidget {
  final Map<String, dynamic> post;

  CommentBottomSheet({Key? key, required this.post}) : super(key: key);

  final List<Map<String, dynamic>> comments = [
    {
      "username": "salsabila",
      "comment": "Wah keren banget postingannya!",
      "replies": [
        {"username": "Anys", "comment": "Setuju banget kak!"}
      ]
    },
    {
      "username": "ridho_27",
      "comment": "Setuju sama ini! 🔥🔥",
      "replies": []
    },
    {
      "username": "nurulhuda",
      "comment": "Lokasinya di mana nih?",
      "replies": [
        {"username": "admin", "comment": "Di daerah Bandung kak 🙌"},
        {"username": "dyssa", "comment": "Di daerah Bandung kak 🙌"}
      ]
    },
    {
      "username": "andika.arts",
      "comment": "Aesthetic parah! 😍",
      "replies": []
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 1.0,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(height: 1),

              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    final replies = comment['replies'] as List<dynamic>;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.person, size: 18, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: "${comment['username']} ",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(text: comment['comment']),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Balas",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Nested replies (statis, dengan avatar & tanpa garis/icon)
                        ...replies.map((reply) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 60, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Avatar lebih kecil untuk balasan
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.grey[300],
                                  child: Icon(Icons.person, size: 14, color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                // Isi komentar balasan
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: "${reply['username']} ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(text: reply['comment']),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  },
                ),
              ),

              // Input komentar (bisa kamu hapus kalau statis semua)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Tambahkan komentar...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Kirim", style: TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
