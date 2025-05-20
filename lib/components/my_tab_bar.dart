import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          //primer tab
          Tab(
            icon: Icon(Icons.home),
          ),

          //Segundo Tab
          Tab(
            icon: Icon(Icons.settings),
          ),

          //Tercer Tab
          Tab(
            icon: Icon(Icons.person),
          ),

        ],
      ),
    );
  }
}