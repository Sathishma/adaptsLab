import 'package:adept_labs/models/album_model.dart';
import 'package:adept_labs/screens/album_screen/album_detail_screen.dart';
import 'package:adept_labs/screens/album_screen/album_controlller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: controller.albumData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlbumDetailScreen(
                              data: controller.photosData[index],
                            )));
              },
              child: AlbumTile(
                album: controller.albumData[index],
              ));
        },
      ),
    );
  }
}

class AlbumTile extends StatelessWidget {
  Map<String, dynamic> album;

  AlbumTile({required this.album});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.folder, size: 100),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                album["title"],
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
