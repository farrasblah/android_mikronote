import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget{
  State<BookmarkPage> createState() => _BookmarkPage();
}

class _BookmarkPage extends State<BookmarkPage> {
  final Map<String?, List<String>> bookmarks = {
    "Artikel Teknologi" : [
      "Flutter : Panduan Bagi Pemula",
    ],
    "Resep Makanan" : [
      "Ayam Goreng Bumbu Kalasan",
      "Tahu Kriuk",
      "Brownies Coklat Lezat"
    ],
    null : ["Ide Proyek Sederhana", "Tips Produktivitas", "Climate for Change"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        children: bookmarks.entries.map((entry) {
          final kategori = entry.key ?? "Tanpa Kategori";
          return ExpansionTile(
            title: Text(
              kategori,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: Border.all(color: Colors.transparent),
            collapsedShape: Border.all(color: Colors.transparent),
            children: entry.value.map((item) {
              return ListTile(
                title: Text(item),
                leading: Icon(Icons.bookmark),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Membuka: $item")),
                  );
                },
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
