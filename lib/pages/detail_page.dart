import 'package:flutter/material.dart';
import 'package:mikronote/models/post_model.dart';
import 'package:mikronote/main.dart';
import 'package:intl/intl.dart';
import 'package:mikronote/widgets/post_image_grid.dart';
import 'package:mikronote/pages/comment.dart';

class DetailPage extends StatefulWidget{

  final Post post;
  final List<Post> allPosts;

  DetailPage({required this.post, required this.allPosts});

  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  final List<Map<String, dynamic>> liked_posts = [
    {
      "username": "Eka<3",
      "date": "2 Januari 2024",
      "title": "Lorem ipsum dolor sit amet",
      "content": "Lorem ipsum dolor sit amet. Et provident voluptatum aut nobis earum rem omnis consectetur hic nemo excepturi eum explicabo nisi aut velit quam et obcaecati internos.",
      "img_links": [
        "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=800",
        "https://images.pexels.com/photos/126407/pexels-photo-126407.jpeg?auto=compress&cs=tinysrgb&w=800"
      ],
    },
    {
      "username" : "Farra Sabiila",
      "date" : "9 Maret 2025",
      "title" : "Lorem ipsum dolor sit amet",
      "content" : "Lorem ipsum dolor sit amet. Quo porro iste eos voluptatum ducimus aut mollitia excepturi quo eius laboriosam et similique mollitia et dolor quas id quis deserunt. Ut harum rerum in voluptatem dolores ut voluptate perspiciatis aut quia pariatur vel voluptatibus porro!",
      "img_links": [],
    },
    {
      "username": "Sirrich",
      "date": "13 Desember 2022",
      "title": "Lorem ipsum dolor sit amet",
      "content": "Et dolor reprehenderit et nisi suscipit id saepe cupiditate quo voluptate perferendis est quidem voluptas. Sed inventore repellat est dolor consequatur a molestiae molestiae cum quisquam inventore vel impedit culpa et nulla dolore?",
      "img_links": [],
    }
  ];

  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  late List<Post> userPosts;

  @override
  void initState() {
    super.initState();
    // Filter semua post dengan username yang sama
    userPosts = widget.allPosts
        .where((p) => p.username == widget.post.username)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.post;
    final post = widget.post;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text("Profile"),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg?auto=compress&cs=tinysrgb&w=600",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[50],
                      ),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[50],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: toggleFollow,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(isFollowing ? "Following" : "Follow"),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "50",
                              style: TextStyle(
                                  color: Colors.grey[50],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Postingan",
                              style: TextStyle(color: Colors.grey[50], fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        Column(
                          children: [
                            Text(
                              "1.2k",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[50],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(fontSize: 14, color: Colors.grey[50]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarDelegate(
                TabBar(
                  tabs: [
                    Tab(text: "Posts"),
                    Tab(text: "Likes"),
                  ],
                  labelColor: Colors.black,
                  indicatorColor: Colors.red[400],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              // Tab 1: Posts
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: userPosts.length,
                itemBuilder: (context, index) {
                  final post = userPosts[index];
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 2),
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
                                  Text(post.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text(DateFormat('d MMMM yyyy').format(post.date), style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                                ],
                              ),
                            ),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(child: Text("Delete")),
                                PopupMenuItem(child: Text("Archive")),
                              ],
                              icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(post.content),
                        SizedBox(height: 16),
                        PostImageGrid(imgLinks: post.img_links),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.favorite_border, color: Colors.grey[600], size: 25),
                            SizedBox(width: 20),
                            Icon(Icons.comment_outlined, color: Colors.grey[600], size: 25),
                            SizedBox(width: 20),
                            Icon(Icons.share_outlined, size: 25, color: Colors.grey[600]),
                            Spacer(),
                            Icon(Icons.bookmark_outline, color: Colors.grey[600], size: 25),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Tab 2: Likes
              ListView.builder(
                  itemCount: liked_posts.length,
                  itemBuilder: (context, index){
                    final likedposts = liked_posts[index];
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 2),
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
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(likedposts["username"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                        Text(likedposts["date"]!, style: TextStyle(color: Colors.grey[500], fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton(itemBuilder: (context)=>[
                                    PopupMenuItem(child: Text("Delete")),
                                    PopupMenuItem(child: Text("Archive")),
                                  ],
                                    icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                likedposts["title"]!, style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                likedposts["content"]!,
                              ),
                              SizedBox(height: 16,),
                              PostImageGrid(imgLinks: likedposts["img_links"]),
                              SizedBox(height: 10,),                                  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.favorite,
                                          color: Colors.red[600], size: 25),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor: Colors.transparent,
                                                builder: (context) => CommentBottomSheet(post: likedposts),
                                              );
                                            },
                                            child: Icon(Icons.comment_outlined, size: 25, color: Colors.grey[600]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Icon(Icons.share_outlined,
                                          size: 25, color: Colors.grey[600]),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.bookmark_outline, color: Colors.grey[600], size: 25,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        if (index != liked_posts.length-1) Divider(height: 1,thickness: 2, color: Colors.grey[200],)
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
