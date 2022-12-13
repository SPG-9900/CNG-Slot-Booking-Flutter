// ignore_for_file: unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:slot_booking/controller/profile_controller.dart';
import 'package:slot_booking/utils/mytheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  // ignore: unused_field
  late AnimationController _animationController;
  late Animation<Offset> _animationImage, _animationCamera;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Container(
                height: 170,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: MyTheme.appBarColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text("Name"),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            readOnly: ProfileController.instance.isEdit.value,
                            // initialValue: name,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFE4EDFF),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color.fromARGB(255, 0, 1, 3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text("Email"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE4EDFF),
                                ),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                ProfileController.instance.toggleEdit();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Color.fromARGB(255, 0, 1, 3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: MyTheme.greyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: Icon(
                            Icons.history_outlined,
                            size: 30,
                          ),
                          title: Text(
                            "History",
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: Icon(
                            Icons.share_outlined,
                            size: 30,
                          ),
                          title: Text("Share Now",
                              style: TextStyle(color: Colors.black)),
                          onTap: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 22, 131, 232),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "Save",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: MediaQuery.of(context).size.width * 0.5 - 60,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: MyTheme.appBarColor,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                left: MediaQuery.of(context).size.width * 0.5 + 20,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyTheme.appBarColor,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
