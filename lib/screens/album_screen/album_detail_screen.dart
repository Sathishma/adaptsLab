import 'package:adept_labs/screens/album_screen/album_controlller.dart';
import 'package:adept_labs/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumDetailScreen extends StatefulWidget {
  Map<String, dynamic> data;

  AlbumDetailScreen({super.key, required this.data});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Album Details",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: Card(
        elevation: 4.0,
        child: Center(
            child: Column(
          children: [
            Image.network(widget.data["url"]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomText(
                text: widget.data["title"],
                maxLines: 5,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
