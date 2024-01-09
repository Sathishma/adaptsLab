import 'package:adept_labs/models/post_model.dart';
import 'package:adept_labs/screens/post_screen/comnets_screen.dart';
import 'package:adept_labs/screens/post_screen/post_controller.dart';
import 'package:adept_labs/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.postData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                            data: controller.commentsData[index])));
              },
              child: PostItem(post: controller.postData[index]));
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  Map<String, dynamic> post;

  PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${post["title"]}',
              fontWeight: FontWeight.bold,
              fontSize: 22,
              maxLines: 3,
            ),
            SizedBox(height: 8.0),
            CustomText(
              text: post["body"] == null ? "" : '${post["body"]}',
              fontSize: 18,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
