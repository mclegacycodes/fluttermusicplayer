import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';




void main()=>runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.subject, size: 30.0, color: Colors.white,),
          actions: [CircularProfileAvatar(
            '',
            child: Image.asset("images/sherif.jpg"),
            borderColor: Colors.blue,
            borderWidth: 5,
            elevation: 2,
            radius: 25
            ,
          ),],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20.0),
            child: Column(
              children: [
                //text container
               Container(
                 child:Column(

                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Text('Hello Mclegacy,',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold
                       ),),
                     Text('What would you like to listen today?',
                       style: TextStyle(
                         color: Colors.white38,
                       ),
                     )
                   ],
                 ),
               ),
                //end of text container
                SizedBox(height: 20,),
                //begin search button
                Card(

                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Search in all',
                    style: TextStyle(
                      fontSize: 12.0,

                    ),),
                    trailing: Icon(Icons.category_outlined),
                  ),
                ),

                //end of search button
                SizedBox(height: 16,),
                //begin carousel
                CarouselSlider(
                  options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                  ),
                  items: ['shatta','sherif','jackie'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(image:AssetImage('images/$i.jpg'),
                                  fit:BoxFit.cover),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),


                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //dot icons
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.circle, color: Colors.white, size:12,),
                                    SizedBox(width: 4,),
                                    Icon(Icons.circle, color: Colors.blue, size:15,),
                                    SizedBox(width: 4,),
                                    Icon(Icons.circle, color: Colors.white, size:12,),
                                  ],),

                                //play icon
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.play_circle_fill, color: Colors.blue,)
                                  ],)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                  //end carousel
                SizedBox(height: 20,),
                //tabbed titles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Trending', style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),),

                    Text('Artist', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),

                    Text('Album', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),

                    Text('Recents', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ],
                ),
                SizedBox(height: 20,),
                //begin music slides
               Column(children: [
                 Card(
                   child: TextButton(
                     onPressed: (){
                      setState(() {
                        player.play("forever.mp3");
                      });
                     },
                     child: ListTile(
                       leading: Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           image: DecorationImage(image:AssetImage('images/jackie.jpg'),
                               fit:BoxFit.cover),
                           borderRadius: BorderRadius.all(Radius.circular(4.0)),


                         )),
                       title: Text("Forever"),
                       subtitle: Text("Gyakie - Seed - EP"),
                       trailing: Text('3:00'),
                     ),
                   ),
                 ),

                 Card(
                   child: TextButton(
                     onPressed: (){
                      setState(() {
                        player.play("second-sermon.mp3");
                      });
                     },
                     child: ListTile(
                       leading: Container(
                           height: 60,
                           width: 60,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             image: DecorationImage(image:AssetImage('images/sherif.jpg'),
                                 fit:BoxFit.cover),
                             borderRadius: BorderRadius.all(Radius.circular(4.0)),


                           )),
                       title: Text("Second Sermon"),
                       subtitle: Text("Black Sherif - unknown"),
                       trailing: Text('3:15'),
                     ),
                   ),
                 ),

                 Card(
                   child: TextButton(
                     onPressed: (){
                       setState(() {
                         player.play("onlydem.mp3");
                       });
                     },
                     child: ListTile(
                       leading:Container(
                           height: 60,
                           width: 60,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             image: DecorationImage(image:AssetImage('images/shatta.jpg'),
                                 fit:BoxFit.cover),
                             borderRadius: BorderRadius.all(Radius.circular(4.0)),


                           )),
                       title: Text("Only Dem"),
                       //subtitle: Text("Gyakie - Seed - EP"),
                       trailing: Text('3:00'),
                     ),
                   ),
                 ),

               ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
