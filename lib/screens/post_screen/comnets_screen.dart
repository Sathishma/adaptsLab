import 'package:adept_labs/models/comments_model.dart';
import 'package:adept_labs/screens/post_screen/post_controller.dart';
import 'package:adept_labs/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsScreen extends StatefulWidget {
  Map<String, dynamic> data;

  CommentsScreen({super.key, required this.data});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Comments Details",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Name: ${widget.data["name"] ?? ""}',
                fontWeight: FontWeight.bold,
                maxLines: 3,
              ),
              SizedBox(height: 8.0),
              CustomText(
                text: 'Email: ${widget.data["email"] ?? ""}',
                maxLines: 2,
              ),
              SizedBox(height: 8.0),
              CustomText(
                text: 'Body: ${widget.data["body"] ?? ""}',
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
