import 'package:flutter/material.dart';
import 'package:mikronote/pages/chage_profile.dart';

class SettingsPage extends StatelessWidget{
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