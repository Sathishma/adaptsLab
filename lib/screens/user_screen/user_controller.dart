import 'package:adept_labs/http/apis.dart';
import 'package:adept_labs/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController with StateMixin {
  UserModel userModel = UserModel();
  final dio = Dio();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  RxString? imagePath;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future getUserDetails() async {
    try {
      var response = await dio.get(API.userApi);
      print("rsponse type : ${response.runtimeType}");
      print("rsponse data type : ${response.data.runtimeType}");
      print("response  : ${response.toString()}");
      print("response data : ${response.data.toString()}");
      if (response.data != null) {
        userModel = UserModel.fromJson(response.data[0]);

        print("userModel runtype : ${userModel.runtimeType}");
        nameController.text = userModel.name ?? "Null";
        emailController.text = userModel.email ?? "Null";
        phoneNoController.text = userModel.phone ?? "Null";
        websiteController.text = userModel.website ?? "Null";
        if (userModel.address != null) {
          Address address = userModel.address!;
          String formattedAddress =
              "${address.street}\n, ${address.suite}\n, ${address.city}\n, ${address.zipcode}";
          if (address.geo != null) {
            Geo geo = address.geo!;
            latController.text = geo.lat!;
            longController.text = geo.lng!;
          }
          addressController.text = formattedAddress;
        }
        if (userModel.company != null) {
          Company company = userModel.company!;
          companyController.text = company.name!;
        }
      } else {
        print("response data null : ${response.data}");
      }
    } catch (e) {
      print("error is :$e");
    }
  }

  Future<void> getPic(String? type) async {
    final picker = ImagePicker();
    if (type!.toLowerCase() == "camera") {
      await picker.pickImage(source: ImageSource.camera).then((values) {
        if (values != null) {
          imagePath = values.path.obs;
        }
      });
    } else if (type.toLowerCase() == "gallery") {
      await picker.pickImage(source: ImageSource.gallery).then((values) {
        if (values != null) {
          imagePath = values.path.obs;
        }
      });
    }
    change(imagePath);
  }

  Future<void> showOptionsDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choose from Gallery'),
                  onTap: () {
                    getPic("gallery").then((value) {
                      Navigator.pop(context);
                      update();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Open Camera'),
                  onTap: () {
                    getPic("camera").then((value) {
                      Navigator.pop(context);
                      update();
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
