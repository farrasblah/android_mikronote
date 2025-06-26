import 'package:flutter/material.dart';
import 'package:mikronote/widgets/post_image_grid.dart';
import 'package:mikronote/pages/comment.dart';
import 'package:mikronote/main.dart';

class ProfilePage extends StatefulWidget{
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {

  final List<Map<String, dynamic>> my_posts = [
    {
      "username": "Your Name",
      "date": "1 Januari 2024",
      "title": "Lorem ipsum dolor sit amet",
      "content": "Lorem ipsum dolor sit amet. Quo porro iste eos voluptatum ducimus aut mollitia excepturi quo eius laboriosam et similique mollitia et dolor quas id quis deserunt. Ut harum rerum in voluptatem dolores ut voluptate perspiciatis aut quia pariatur vel voluptatibus porro! Ea blanditiis reiciendis ut incidunt saepe qui nesciunt mollitia. In laboriosam cupiditate ab officiis quidem a tempora assumenda At voluptas rerum est animi dolorum?",
      "img_links": [
        "https://images.pexels.com/photos/1009841/pexels-photo-1009841.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/175695/pexels-photo-175695.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/2373520/pexels-photo-2373520.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/2638026/pexels-photo-2638026.jpeg?auto=compress&cs=tinysrgb&w=600"
      ]
    },
    {
      "username": "Your Name",
      "date": "12 July 2024",
      "title": "Lorem ipsum dolor sit amet",
      "content": "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.""",
      "img_links": [
        "https://images.pexels.com/photos/887850/pexels-photo-887850.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/1579926/pexels-photo-1579926.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://th.bing.com/th?q=Makanan+Manis&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.3&pid=InlineBlock&mkt=en-ID&cc=ID&setlang=en&adlt=strict&t=1&mw=247",
      ],
    },
    {
      "username": "Your Name",
      "date": "13 Desember 2022",
      "title": "Lorem ipsum dolor sit amet",
      "content": "Et dolor reprehenderit et nisi suscipit id saepe cupiditate quo voluptate perferendis est quidem voluptas. Sed inventore repellat est dolor consequatur a molestiae molestiae cum quisquam inventore vel impedit culpa et nulla dolore?",
      "img_links": [
        "https://images.pexels.com/photos/2638026/pexels-photo-2638026.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/2373520/pexels-photo-2373520.jpeg?auto=compress&cs=tinysrgb&w=600"
      ],
    }
  ];

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

  List<bool> favorites = [];

  @override
  void initState() {
    super.initState();
    favorites = List<bool>.filled(my_posts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrooled) => [
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
                    ),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg?auto=compress&cs=tinysrgb&w=600"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  print("Ganti foto profil diklik!");
                                },
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[50])),
                        Text("Email@google.com", style: TextStyle(fontSize: 16, color: Colors.grey[50])),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("50", style: TextStyle(color: Colors.grey[50], fontWeight: FontWeight.bold, fontSize: 20)),
                                Text("Posts", style: TextStyle(color: Colors.grey[50], fontSize: 14)),
                              ],
                            ),
                            SizedBox(width: 40),
                            Column(
                              children: [
                                Text("1.2k", style: TextStyle(fontSize: 20, color: Colors.grey[50], fontWeight: FontWeight.bold)),
                                Text("Followers", style: TextStyle(fontSize: 14, color: Colors.grey[50])),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: TabBarDelegate(
                      TabBar(
                        tabs: [
                          Tab(text: "Your Posts",),
                          Tab(text: "Likes",),
                        ],
                        labelColor: Colors.black,
                        indicatorColor: Colors.red[400],
                      )
                  ),
                  pinned: true,
                )
              ],
              body: TabBarView(
                  children: [
                    // tab ke 1
                    ListView.builder(
                        itemCount: my_posts.length,
                        itemBuilder: (context, index){
                          final myposts = my_posts[index];
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
                                                Text(myposts["username"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                                Text(myposts["date"]!, style: TextStyle(color: Colors.grey[500], fontSize: 12),)
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
                                        myposts["title"]!, style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        myposts["content"]!,
                                      ),
                                      SizedBox(height: 16,),
                                      PostImageGrid(imgLinks: myposts["img_links"]),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    favorites[index] = !favorites[index];
                                                  });
                                                },
                                                child: Icon(
                                                  favorites[index] ? Icons.favorite : Icons.favorite_border,
                                                  color: favorites[index] ? Colors.red : Colors.grey[600],
                                                  size: 25,
                                                ),
                                              )
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
                                                        builder: (context) =>CommentBottomSheet(post: myposts),
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
                                              Icon(Icons.share_rounded,
                                                  size: 25, color: Colors.grey[600]),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.bookmark_border, color: Colors.grey[600], size: 25,)
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                              if (index != my_posts.length-1) Divider(height: 1,thickness: 2, color: Colors.grey[200],)
                            ],
                          );
                        }
                    ),
                    // Tab ke 2
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
                    )
                  ]
              )
          ),
        )
    );
  }
}
