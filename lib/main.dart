import 'package:adept_labs/screens/album_screen/album_controlller.dart';
import 'package:adept_labs/screens/album_screen/album_screen.dart';
import 'package:adept_labs/screens/post_screen/post_controller.dart';
import 'package:adept_labs/screens/post_screen/post_screen.dart';
import 'package:adept_labs/screens/user_screen/user_controller.dart';
import 'package:adept_labs/screens/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    Get.put(UserController());
    Get.put(AlbumController());
    Get.put(PostController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adapt Labs'),
        backgroundColor: Colors.green,
      ),
      body: TabBarView(
        controller: tabController,
        children: [UserScreen(), AlbumScreen(), PostScreen()],
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: const [
          Tab(text: 'User Profile'),
          Tab(text: 'Albums'),
          Tab(text: 'Posts'),
        ],
      ),
    );
  }
}
