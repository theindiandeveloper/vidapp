
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';



class SingleSlider extends StatefulWidget {
  const SingleSlider({Key? key, required this.title, required this.description, required this.videourl, required this.author, required this.date, required this.address, required this.views, required this.likes, required this.authorprofilepic, required this.videoid}) : super(key: key);
  final String title;
  final String description;
  final String videourl;
  final String author;
  final String date;
  final String address;
  final int views;
  final int likes;
  final String authorprofilepic;
  final String videoid;

  @override
  State<SingleSlider> createState() => _SingleSliderState();
}

class _SingleSliderState extends State<SingleSlider> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(this.widget.videourl)..initialize().then((value) => {
      setState((){})
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child:Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(this.widget.authorprofilepic),),
              SizedBox(width: 7,),
              Text(this.widget.author,style: TextStyle(color:Colors.black, fontSize: 20),),
              SizedBox(width: 7,),
              InkWell(onTap: followuser(this.widget.videoid),child: Text("Follow" , style: TextStyle(color: Colors.red),),)
            ],
          ),),
          SizedBox(height: 7,),
          InkWell(
            onTap: ()=>{_controller.value.isPlaying?_controller.pause():_controller.play()},
            child: _controller.value.isInitialized?AspectRatio(aspectRatio: 1.7,child: VideoPlayer(_controller),):
            AspectRatio(aspectRatio: 2.5,child: Container(color: Colors.black,child: Center(child: CircularProgressIndicator(),),),),
          ),
          Container(color: Colors.black87,
            padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),


            child: Row(children: [
            Icon(Icons.favorite_border,color: Colors.white60,),
            Text(this.widget.likes.toString(),style: TextStyle(color: Colors.white60,fontSize: 20),),
            Icon(Icons.share_outlined,color: Colors.white60,),
              Text(this.widget.likes.toString(),style: TextStyle(color: Colors.white60,fontSize: 20),),


            ],),),
          Container(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),
            child:

            Text(this.widget.title, style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "sans"),textAlign: TextAlign.justify),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),

            child: Row(children: [
            Text((widget.views+1).toString()+" "+"Views"+"  |  "+widget.address+" "+widget.date)
          ],),)
        ],
      ),
    );
  }

  followuser(String videoid) {
    print("Follow request found");

  }
}
