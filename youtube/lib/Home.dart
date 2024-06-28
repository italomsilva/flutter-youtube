import 'package:flutter/material.dart';
import 'package:youtube/views/HomeView.dart';
import 'package:youtube/views/HotView.dart';
import 'package:youtube/views/LibraryView%5B.dart';
import 'package:youtube/views/SubscribeView.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var indexButton = 0;
  List<Widget> telas =[
    HomeView(),
    Subscribeview(),
    LibraryView(),
    HotView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image(
          image: AssetImage("images/logo_youtube.png"),
          width: 80,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){print("videocam");},
            icon: Icon(Icons.videocam),
          ),
          IconButton(onPressed: (){print("pesquisa");},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: (){print("conta");},
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        child:  telas[indexButton],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: indexButton,
        onTap: (index){
          setState(() {
            indexButton= index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em alta",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Incrições",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: "Biblioteca",
          ),
        ],
      ),
    );
  }
}
