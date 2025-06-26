import 'package:flutter/material.dart';

class CommentBottomSheet extends StatelessWidget {
  final Map<String, dynamic> post;

  CommentBottomSheet({Key? key, required this.post}) : super(key: key);

  final List<Map<String, String>> comments = [
    {"username": "salsabila", "comment": "Wah keren banget postingannya!"},
    {"username": "ridho_27", "comment": "Setuju sama ini! 🔥🔥"},
    {"username": "nurulhuda", "comment": "Lokasinya di mana nih?"},
    {"username": "andika.arts", "comment": "Aesthetic parah! 😍"},
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6, // 60% tinggi layar saat dibuka
      minChildSize: 0.4,     // bisa dikecilkan sampai 40%
      maxChildSize: 1.0,     // bisa di-scroll penuh
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              // Handle indicator
              Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Optional: Post preview
              ListTile(
                title: Center(
                  child: Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ),
              Divider(height: 1),

              // List komentar
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 18, color: Colors.white),
                      ),
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${comment['username']} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: comment['comment'],
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    );
                  },
                ),
              ),

              // Kolom input komentar
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
                      onPressed: () {
                        // Aksi kirim komentar
                      },
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
