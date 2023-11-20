import 'package:easy_localization/easy_localization.dart';
import 'package:elearning_flutter/screens/profile.dart';
import 'package:elearning_flutter/screens/settings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController _searchTextController = TextEditingController();
  Color themeColor = Color.fromARGB(255, 47, 206, 238);
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: themeColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * .05,
                      backgroundImage: NetworkImage(
                          "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                    ),
                    trailing: IconButton(
                      icon: Icon(darkTheme ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.white),
                      onPressed: () {
                        setState(() {
                          darkTheme = !darkTheme;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Yared Fekade",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'jaredyared83@gmail.com',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings").tr(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              splashColor: Colors.grey[300],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 206, 238),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Yared 👋",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white, fontSize: 12.0, fontFamily: 'PowerGeez'),
            ).tr(),
            Text(
              "Let's start learning",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'PowerGeez',
              ),
            ).tr(),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu, color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  color: Color.fromARGB(255, 47, 206, 238),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 18.0),
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * .96,
                    child: TextField(
                      controller: _searchTextController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: "Search".tr(),
                        hintStyle: TextStyle(
                          fontFamily: 'PowerGeez',
                        ),
                        prefixIcon:
                            Icon(Icons.search_rounded, color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PowerGeez',
                    ),
                  ).tr(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 47, 206, 238),
                      fontSize: 12.0,
                      fontFamily: 'PowerGeez',
                    ),
                  ).tr(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
