import 'package:flutter/material.dart';
import 'post_image_grid.dart';

void main() {
  runApp(MikronoteApp());
}

class MikronoteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  State<HalamanUtama> createState() => _HalamanUtama();
}

class _HalamanUtama extends State<HalamanUtama>{

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    NotificationPage(),
    BookmarkPage(),
    ProfilePage(),
  ];

  void _onTappedItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:  _selectedIndex == 3
        ? AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage())
                );
              },
              icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.red[400],
        )
        :AppBar(
        backgroundColor: Colors.grey[50],
        title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "μikro",
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )
                ),
                TextSpan(
                  text: "Note",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            )
          )
        ),
      drawer: _selectedIndex == 3 ? null : Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Your Name"),
                  accountEmail: Text("Email@google.com"),
                decoration: BoxDecoration(
                  color: Colors.red[400]
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg?auto=compress&cs=tinysrgb&w=600"),
                  radius: 35,
                ),
              ),
              ListTile(
                title: Text("Settings"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> SettingPage()));
                }
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout_rounded),
                onTap: (){},
              ),
            ],
          )
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[50],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[400],
          onTap: _onTappedItem,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: ''
            ),
          ]
        ),
      );
  }
}

class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.red[400],
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 40,
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
                    ),
                  ],
                ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Your Name", style: TextStyle(
                        color: Colors.grey[50],
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                    ),
                    Text("email@gmail.com", style: TextStyle(
                        color: Colors.grey[50],
                        fontSize: 16
                    ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey[50]
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_2_outlined),
                    title: Text("Change Profile"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeProfilePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.archive_outlined),
                    title: Text("Archive"),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_active_outlined),
                    title: Text("Activity Center"),
                    onTap: (){

                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.add_circle_outline),
                    title: Text("Add Account"),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_rounded),
                    title: Text("Logout"),
                    onTap: (){

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
            hintText: "Apa yang kamu pikirkan",
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

class ChangeProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Profile"),
      ),
    );
  }
}

class DetailPage extends StatefulWidget{
  final String username;

  DetailPage({required this.username});

  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage>{
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16)),
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
                      widget.username,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[50],
                      ),
                    ),
                    Text(
                      "Email@google.com",
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
                              style: TextStyle(
                                  color: Colors.grey[50], fontSize: 14),
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
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[50]),
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
              delegate: _TabBarDelegate(
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
              //tab 1
              ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Posts")
                    ],
                  )
                ],
              ),
              // tab 2
              ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Likes")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  final List<Map<String, dynamic>> posts = [
    {
      "username" : "Alissa Rania",
      "date" : "12 Januari 2025",
      "title" : "Lorem ipsum dolor sit amet",
      "content" : "Lorem ipsum dolor sit amet. Quo porro iste eos voluptatum ducimus aut mollitia excepturi quo eius laboriosam et similique mollitia et dolor quas id quis deserunt. Ut harum rerum in voluptatem dolores ut voluptate perspiciatis aut quia pariatur vel voluptatibus porro! Ea blanditiis reiciendis ut incidunt saepe qui nesciunt mollitia. In laboriosam cupiditate ab officiis quidem a tempora assumenda At voluptas rerum est animi dolorum?",
      "comments" : [
        {
          "username": "komentator1",
          "text": "Komentar utama 1",
        }
      ]
    },
    {
      "username" : "Farra Sabiila",
      "date" : "9 Maret 2025",
      "title" : "Lorem ipsum dolor sit amet",
      "content" : "Lorem ipsum dolor sit amet. Quo porro iste eos voluptatum ducimus aut mollitia excepturi quo eius laboriosam et similique mollitia et dolor quas id quis deserunt. Ut harum rerum in voluptatem dolores ut voluptate perspiciatis aut quia pariatur vel voluptatibus porro!",
      "comments" : []
    },
    {
      "username" : "Anieen",
      "date" : "1 Maret 2025",
      "title" : "Lorem ipsum dolor sit amet",
      "content" : "Lorem ipsum dolor sit amet. Quo porro iste eos voluptatum ducimus aut mollitia excepturi quo eius laboriosam et similique mollitia et dolor quas id quis deserunt. Ut harum rerum in voluptatem dolores ut voluptate perspiciatis aut quia pariatur vel voluptatibus porro!",
      "comments" : []
    },
    {
      "username" : "AbeAbeAbe",
      "date" : "1 Oktober 2024",
      "title" : "Lorem ipsum dolor sit amet",
      "content" : "Lorem ipsum dolor sit amet. Eum dolores assumenda vel eveniet natus et voluptas molestiae et quas sint hic veritatis odit et obcaecati nihil et quia odio. Nam ipsum possimus 33 odio laudantium aut expedita iste rem pariatur unde ut voluptatibus doloremque.",
      "comments" : []
    },
  ];

  List<bool> favorites = [];
  List<bool> bookmarks = [];

  @override
  void initState() {
    super.initState();
    favorites = List<bool>.filled(posts.length, false);
    bookmarks = List<bool>.filled(posts.length, false);
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
      body: ListView.builder(
        itemCount: posts.length,
          itemBuilder: (context, index){
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
                      SizedBox(width: 20,),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => DetailPage(username:post["username"]!))
                                  );
                                },
                                child : Text(
                                  post["username"]!,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              Text(
                                post["date"]!,
                                style: TextStyle(color: Colors.grey[500], fontSize: 12),
                              )
                            ],
                          ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context)=> [
                          PopupMenuItem(
                              child: Text("Block"),
                          ),
                          PopupMenuItem(
                              child: Text("Report")
                          )
                        ],
                        icon: Icon(Icons.more_vert, color: Colors.grey[600],),
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    post["title"]!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    post["content"]!,
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                favorites[index] = !favorites[index];
                              });
                            },
                            child: Icon(
                              favorites[index]? Icons.favorite : Icons.favorite_border,
                              color: favorites[index]? Colors.red : Colors.grey[600],
                              size: 25,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Icon(Icons.comment_outlined,
                              size: 25, color: Colors.grey[600]),
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
                      )
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
      "img_links": [],
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
                    delegate: _TabBarDelegate(
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
                                              Icon(Icons.comment_outlined,
                                                  size: 25, color: Colors.grey[600]),
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
                                              Icon(Icons.bookmark_add_outlined, color: Colors.grey[600], size: 25,)
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
                                          Icon(Icons.comment_outlined,
                                              size: 25, color: Colors.grey[600]),
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
                                          Icon(Icons.bookmark_add_outlined, color: Colors.grey[600], size: 25,)
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

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _TabBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Colors.grey[50],
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}


