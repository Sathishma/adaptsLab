import 'dart:io';

import 'package:adept_labs/screens/user_screen/user_controller.dart';
import 'package:adept_labs/utils/image_resource.dart';
import 'package:adept_labs/utils/string_resource.dart';
import 'package:adept_labs/widgets/customTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
              await controller.showOptionsDialog(context);
            },
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(60)),
                child: controller.imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.file(
                          File(controller.imagePath!.value),
                          fit: BoxFit.fill,
                        ),
                      )
                    : Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            ImageResource.contactAddIcon,
                            height: 300,
                            width: 300,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        Center(
                          child: Image.asset(ImageResource.addPhotoIcon,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color,
                              height: 30,
                              width: 30),
                        ),
                      ]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.name,
            hintText: StringResources.name,
            controller: controller.nameController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.email,
            hintText: StringResources.email,
            controller: controller.emailController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.address,
            hintText: StringResources.address,
            controller: controller.addressController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.latitude,
            hintText: StringResources.latitude,
            controller: controller.latController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.longitude,
            hintText: StringResources.longitude,
            controller: controller.longController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.phoneNo,
            hintText: StringResources.phoneNo,
            controller: controller.phoneNoController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.website,
            hintText: StringResources.website,
            controller: controller.websiteController,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: StringResources.company,
            hintText: StringResources.company,
            controller: controller.companyController,
          ),
          const SizedBox(height: 30),
        ]),
      ),
    ));
  }
}
