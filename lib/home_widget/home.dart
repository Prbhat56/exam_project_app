import 'package:exam_project_app/home_widget/home_page.dart';
import 'package:exam_project_app/home_widget/profile_page.dart';
import 'package:exam_project_app/home_widget/search_page.dart';
import 'package:exam_project_app/home_widget/static_page.dart';
import 'package:flutter/material.dart';






class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late List<Widget> tabs; 
 

  @override
  void initState() {
    super.initState();
 
    tabs = [
      HomePage(),
      SearchPage(),
      StaticPage(), 
      SettingsPage(), 
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: "Search",
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.shopping_basket),
            label: "Statics",
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Profile",
            backgroundColor: Colors.white
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
