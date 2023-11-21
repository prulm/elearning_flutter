import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      backgroundColor: Colors.grey[100],
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: themeColor,
              ),
              // currentAccountPicture: Image.network(
              //     "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
              // accountName: Text("Yared Fekade"),
              // accountEmail: Text("Jaredyared83@gmail.com"),
              // onDetailsPressed: () {},
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
                Navigator.pop(context);
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
        elevation: 0.0,
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
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.notifications,
        //         color: Colors.white,
        //       )),
        //   Builder(
        //     builder: (context) => IconButton(
        //         onPressed: () {
        //           Scaffold.of(context).openDrawer();
        //           setState(() {});
        //         },
        //         icon: Icon(Icons.menu, color: Colors.white)),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    height: MediaQuery.sizeOf(context).height * .07,
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: TextField(
                      controller: _searchTextController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 47, 206, 238),
                        fontSize: 12.0,
                        fontFamily: 'PowerGeez',
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
