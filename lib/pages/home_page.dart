import 'package:flutter/material.dart';
import 'package:mikronote/models/post_model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:mikronote/pages/new_post_page.dart';
import 'package:mikronote/widgets/post_image_grid.dart';
import 'package:mikronote/pages/comment.dart';
import 'package:mikronote/pages/detail_page.dart';

class HomePage extends StatefulWidget{
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  List<Post> posts = [];
  List<bool> favorites = [];
  List<bool> bookmarks = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
    favorites = List<bool>.filled(posts.length, false);
    bookmarks = List<bool>.filled(posts.length, false);
  }

  Future<void> loadPosts() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/posts.json');
      print("✅ JSON Loaded");

      final List<dynamic> data = json.decode(jsonString);
      print("✅ JSON Decoded: ${data.length} items");

      final loadedPosts = data.map((e) => Post.fromJson(e)).toList();

      setState(() {
        posts = loadedPosts;
        favorites = List<bool>.filled(posts.length, false);
        bookmarks = List<bool>.filled(posts.length, false);
      });
    } catch (e) {
      print("❌ ERROR loading posts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPostPage()),
          );
        },
        backgroundColor: Colors.red[400],
        child: Icon(Icons.add, color: Colors.grey[50]),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 1),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final selectedPost = posts[index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(post: post,allPosts: posts,),
                                ),
                              );
                            },
                            child: Text(
                              post.username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(post.date),
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(child: Text("Block")),
                        PopupMenuItem(child: Text("Report")),
                      ],
                      icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(post.content),
                SizedBox(height: 16),
                PostImageGrid(imgLinks: post.img_links),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          favorites[index] = !favorites[index];
                        });
                      },
                      child: Icon(
                        favorites[index] ? Icons.favorite : Icons.favorite_border,
                        color: favorites[index] ? Colors.red : Colors.grey[600],
                        size: 25,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => CommentBottomSheet(post: post.toJson()),
                        );
                      },
                      child: Icon(Icons.comment_outlined,
                          size: 25, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.share_outlined, size: 25, color: Colors.grey[600]),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bookmarks[index] = !bookmarks[index];
                        });
                      },
                      child: Icon(
                        bookmarks[index] ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.grey[600],
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}