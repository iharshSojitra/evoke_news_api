import 'package:evoke_news_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selected = 0;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu, color: Colors.black54),
          title: Image.asset(
            'assets/images/evoke_logo.jpg',
            height: height * 0.3,
            width: width * 0.4,
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black54,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            onTap: (value) {
              setState(() {
                selected = value;
              });
            },
            tabs: [
              Text("HOME", style: TextStyle(color: Colors.black54)),
              Text("NEWS", style: TextStyle(color: Colors.black54)),
              Text("SHOWBI", style: TextStyle(color: Colors.black54)),
              Text("EXTRA", style: TextStyle(color: Colors.black54)),
              Text("STYLE", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            HomeScreen(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ));
  }
}
