import 'package:adept_labs/http/apis.dart';
import 'package:adept_labs/models/comments_model.dart';
import 'package:adept_labs/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PostController extends GetxController with StateMixin {
  final dio = Dio();
  PostModel postModel = PostModel();
  CommentsModel commentsModel = CommentsModel();
  List<dynamic> postData = [];
  List<dynamic> commentsData = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getPosts();
    await getComments();
  }

  Future getPosts() async {
    try {
      var response = await dio.get(API.postApi);
      if (response.data != null) {
        postModel = PostModel.fromJson(response.data[0]);
        change(postData = response.data);
      }
    } catch (e) {
      print("error is :$e");
    }
  }

  Future getComments() async {
    try {
      var response = await dio.get(API.commentsApi);
      if (response.data != null) {
        commentsModel = CommentsModel.fromJson(response.data[0]);
        change(commentsData = response.data);
      }
    } catch (e) {
      print("error is :$e");
    }
  }
}
