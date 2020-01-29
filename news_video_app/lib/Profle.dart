import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
         
         ListTile(
           leading: Padding(
             padding: const EdgeInsets.all(8.0),
             child: CircleAvatar(
               radius: 25,
               backgroundImage: NetworkImage("https://i7.pngguru.com/preview/831/88/865/user-profile-computer-icons-user-interface-mystique.jpg"),
             ),
           ),
         ),

          ListTile(
            title: Text("Vikash Pandey"),
            trailing: Icon(Icons.arrow_drop_down),
            subtitle: Text("Manage your Google Account",
            style: TextStyle(
              color: Colors.blue[800]
             ),
            ),
          ),

          
          Container(
            height: 0.75,
            width: double.infinity,
            color: Colors.grey,
          ),

          // ListTile(
          //   leading: Icon(Icons.account_box),
          //   title: Text("Your channel"),
          // ),

          //  ListTile(
          //   leading: Icon(Icons.account_box),
          //   title: Text("Your channel"),
          // ),

           ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Time Watched"),
          ),

           ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Get News Premium"),
          ),

           ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Paid Membership"),
          ),


           ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Switch Account"),
          ),

           ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Turn on Incognito"),
          ),

          
          Container(
            height: 0.75,
            width: double.infinity,
            color: Colors.grey,
          ),


          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("News Studio"),
            trailing: Icon(Icons.edit),
          ),

           ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),

          Center(child: Text("Privacy Policy - Terms of Service"))


        ],
      ),
 
    );
  }
}