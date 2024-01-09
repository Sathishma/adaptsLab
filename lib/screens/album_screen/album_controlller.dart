import 'package:adept_labs/http/apis.dart';
import 'package:adept_labs/models/album_model.dart';
import 'package:adept_labs/models/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController with StateMixin {
  AlbumModel albumModel = AlbumModel();
  PhotosModel photosModel = PhotosModel();
  final dio = Dio();
  List<dynamic> albumData = [];
  List<dynamic> photosData = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAlbumList();
    await getAlbumDetails();
  }

  Future getAlbumList() async {
    try {
      var response = await dio.get(API.albumApi);
      if (response.data != null) {
        albumModel = AlbumModel.fromJson(response.data[0]);
        change(albumData = response.data);
      }
    } catch (e) {
      print("error is :$e");
    }
    change(isLoading.value = false);
  }

  Future getAlbumDetails() async {
    try {
      var response = await dio.get(API.photosApi);
      if (response.data != null) {
        photosModel = PhotosModel.fromJson(response.data[0]);
        change(photosData = response.data);
      }
    } catch (e) {
      print("error is :$e");
    }
  }
}
