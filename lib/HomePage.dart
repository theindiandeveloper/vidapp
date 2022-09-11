import 'package:flutter/material.dart';
import 'package:vidapp/notificationview.dart';
import 'package:vidapp/profileview.dart';
import 'package:vidapp/searchview.dart';
import 'package:vidapp/slideview.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  List pagelist =[SlideView(),SearchView(),NotificationView(),ProfileView()];
  var indexrecord=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagelist[indexrecord],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexrecord,
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (index)=>{
          setState((){
            indexrecord=index;
          })
        },
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: ()=>{
        print("hello this button has clicked")
      }),
    );
  }
}
