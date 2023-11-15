import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  bool isVisible = false;

  Future<void> galleryImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Future<void> cameraImage() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void showDiaglogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Image Source"),
        content: Container(
          height: MediaQuery.of(context).size.height * .2,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: cameraImage,
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap: galleryImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80.0,
                  child: image != null
                      ? Image.file(File(image!.path))
                      : Image.network(
                          "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                ),
                Positioned(
                  bottom: 3.0,
                  right: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        showDiaglogue(context);
                      },
                      highlightColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25, top: 10),
              child: Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )),
                  hintText: 'Your name here...',
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25, top: 10),
              child: Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )),
                  hintText: 'example@gmail.com',
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25, top: 10),
              child: Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 35,
              child: TextField(
                obscureText: !isVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )),
                  hintText: 'Enter a password',
                  contentPadding: EdgeInsets.only(left: 10),
                  suffixIcon: IconButton( 
                    icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => isVisible = !isVisible);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              child: Text(
                "Save Changes",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
