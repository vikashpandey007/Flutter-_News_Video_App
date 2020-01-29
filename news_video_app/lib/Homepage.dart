// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:news_app/NextPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:news_video_app/Home.dart';
import 'package:news_video_app/Profle.dart';
import 'package:news_video_app/Video.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  
   void changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }
  //   void changeColor() {
  //   DynamicTheme.of(context).setThemeData(new ThemeData(
  //       primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: Colors.indigo
  //   ));
  // }
  var btn1 = false; 
  String categaryname = "NEWS APP";
 changecategary(){
    
 }
   var data;
   String url =
      "http://news.raushanjha.in/flutterapi/public/index.php/getnewsall";
  Future<String> getjsondata() async {
    var responese = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdata = json.decode(responese.body);
      data = convertdata;
      print(data);
    });
  }
   @override
  void initState() {
     tabController = new TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    getjsondata();

    super.initState();
  }
   
   var tabController;
  var scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

           drawer: Drawer(child: 
        ListView(children: <Widget>[

          
       ListTile(
         title: Text("Sub-categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red, ),),
         onTap: null,
       ),
        Divider(),
       
       ListTile(
         leading: Icon(Icons.business,color: Colors.red,),
         title: Text("business",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap:() {
           categaryname = "business";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
        ListTile(
        leading: Icon(Icons.radio,color: Colors.red,),
         title: Text("entertainment",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap: (){
           categaryname = "entertainment";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
        ListTile(
        leading: Icon(Icons.healing,color: Colors.red,),
         title: Text("health",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap: (){
           categaryname = "health";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
        ListTile(
          leading: Icon(Icons.memory,color: Colors.red,),
         title: Text("Science",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap: (){
           categaryname = "science";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
       ListTile(
          leading: Icon(Icons.directions_run,color: Colors.red,),
         title: Text("Sports",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap: (){
           categaryname = "Sports";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
        ListTile(
          leading: Icon(Icons.mobile_screen_share,color: Colors.red,),
         title: Text("Technology",style: TextStyle(fontSize: 25,color: Colors.red),),
         onTap: (){
           categaryname ="technology";
           url = "";
           getjsondata();
         },
       ),
        Divider(),
       
         ListTile(leading: Icon(Icons.brightness_2,size: 28,color: Colors.red,),
           title: Text("Change Theme",
           style: TextStyle( fontSize: 25,color: Colors.red),
          ),
          onTap: () {
            changeBrightness();
            // changeColor();
          },
         ),

        ],),),
      body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                // centerTitle: true,
                  actions: <Widget>[
                    Container(
                      width: 50,
                    )
                  ],
                  pinned: true,
                  // floating: true,
                  // backgroundColor: Colors.blue,
                  title: Text(categaryname,style: TextStyle(color: Colors.red),),
                  bottom: TabBar(
                    unselectedLabelColor: Colors.blue,
                    indicatorWeight: 4.0,
                    labelColor: Colors.red,
                    indicatorColor: Colors.white,
                    controller: tabController,
                    tabs: <Widget>[
                     
                      Tab(
                        icon: Icon(Icons.home),
                        child: Text("Home"),
                      ),
                      Tab(
                         icon: Icon(
                      Icons.live_tv, ),
                        child: Text("Video"),
                      ),
                      Tab(
                        icon: Icon(Icons.person_pin),
                        child: Text("Profile"),
                        
                      )
                    ],
                  ))
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: <Widget>
            [Home(data),
             Video(data), Profile()],
          ),
        ),
    );
  }
}