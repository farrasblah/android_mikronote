import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mikronote/pages/home_page.dart';
import 'package:mikronote/pages/profil_page.dart';
import 'package:mikronote/pages/bookmark_page.dart';
import 'package:mikronote/pages/notification_page.dart';
import 'package:mikronote/pages/settings_page.dart';
import 'package:mikronote/pages/search_page.dart';

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
    SearchPage(),
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
      appBar:  _selectedIndex == 4
        ? AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage())
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
        backgroundColor: Colors.grey[50],
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
                      MaterialPageRoute(builder: (context)=> SettingsPage()));
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
                icon: Icon(Icons.home), label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded), label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: ''
            ),
          ]
        ),
      );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Colors.grey[50],
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}


