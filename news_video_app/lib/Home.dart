import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_video_app/Nextpage.dart';



class Home extends StatefulWidget {
  final data;
  Home(this.data);
  @override
  _HomeState createState() => _HomeState(data);
}

class _HomeState extends State<Home> {
  spin(){
    return SpinKitCircle(color: Colors.red);
  }
  var data1;

  _HomeState(this.data1);

  @override
  Widget build(BuildContext context) {
    return data1!= null?
     Scaffold(
        body: ListView.builder(
            itemCount: data1.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 500,
                  // color: Colors.red[100],
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nextpage(
                                        data1,
                                        index,
                                      )));
                        },
                       
                        child: data1[index]['news_image']!=null?
                         Container(
                          child: Image(
                            height: 300,
                            width: 390,
                            image: NetworkImage('http://news.raushanjha.in/upload/${data1[index]["news_image"]}'),
                          ),
                        ):spin()
                      ),
                      data1[index]['news_title']!=null?
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: Text(
                            data1[index]['news_title'],
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black,),
                          ),
                        ),
                      ):spin(),
                      data1[index]["news_date"]!=null?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            child: Text(data1[index]["news_date"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red,),),
                          ),
                        ],
                      ):spin()
                    ],
                  ));
            })):spin();
  }
}
