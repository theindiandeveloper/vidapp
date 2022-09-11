import 'package:flutter/material.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late var username;
  late var fullname;
  late var profilepic;
  late var bio;
  late var folowers;
  late var following;
  late var groups;
  late var approved_videos;
  late var favoritevideos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState((){
      fullname="Admin";
      username="@admin";
      bio="no bio yet";
      profilepic="https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=";
      following=10;
      folowers=0;
      groups=0;
      approved_videos=[1,2,3];
      favoritevideos=0;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Welcome "+fullname, style: TextStyle(color: Colors.black),),
          actions: [
            InkWell(
              onTap: (){},
              child: Icon(Icons.settings,size:30,color: Colors.black,),
            ),
            SizedBox(width: 8,),
            InkWell(
              onTap: (){},
              child: Icon(Icons.message,size: 30, color: Colors.black,),

            ),
            SizedBox(width: 15,)
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Center(child: CircleAvatar(backgroundImage: NetworkImage(profilepic,),maxRadius: 70,child: InkWell(
                onTap: ()=>{debugPrint("change profile pic")},
              ),)),
              SizedBox(height: 14,),
              Text(fullname,style: TextStyle(color: Colors.black,fontSize: 24),),
              Text(username,style: TextStyle(color: Colors.black54,fontSize: 20),),
              Container(
                padding: EdgeInsets.only(left: 24,right: 14),
                child: Row(children: [
                  Center(child: Text(folowers.toString()+" Followers | "+following.toString()+" Following |"+" 0 Likes",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20),))
                ],),
              ),





            ],
          ),
        ),
      ),
      color: Colors.black,
    );
  }
}
