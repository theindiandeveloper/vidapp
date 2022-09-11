import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vidapp/VideoModel.dart';
import 'package:vidapp/singleslide.dart';
import 'dart:convert';

import 'package:video_player/video_player.dart';


class SlideView extends StatefulWidget {
  const SlideView({Key? key}) : super(key: key);

  @override
  State<SlideView> createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  PageController pagecont = PageController(initialPage: 0);
  late PageController _pageController;
  List  datalist =[
    {"title":"Hello world This is a nice video and I am a developer and I am testing my skills for new news","desc":"Nice this is a description",
    "videourl":"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author":"Admin","date":"dd-mm-yyyy","address":"adresss s24 pgs","views":0,"likes":0,
      "authorprofilepic":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {"title":"Hello world","desc":"Nice this is a description",
      "videourl":"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "author":"Admin","date":"dd-mm-yyyy","address":"adresss s24 pgs","views":0,"likes":0,
      "authorprofilepic":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
  ];

  final  url="http://192.168.173.209/vidvibe/";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 20));
    getData();

    setState((){
      _pageController = PageController(initialPage: 0);

    });

  }
  Future getData() async{
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    print(response.body);
    if(response.statusCode==200){
      var data = json.decode(response.body) as List;
      print(data);
      // videlist = data.map((anyname) => VideoModel.fromJson(anyname)).toList();
      

    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(itemBuilder: (context,indexposition){
        var obj=datalist[indexposition];
        return SingleSlider(title:obj["title"] , description: obj["desc"],
            videourl: obj["videourl"], author: obj["author"], date: obj["date"],
            address: obj["address"], views: obj["views"]+1, likes: obj["likes"],
            authorprofilepic: obj["authorprofilepic"], videoid: "videoid");
      },itemCount: datalist.length,scrollDirection: Axis.vertical,controller: _pageController,)

    );
  }
}
