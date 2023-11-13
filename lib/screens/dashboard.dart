import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Yared 👋",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.2,
              fontSize: 12.0,
            ),
            ),
            Text("Let's start learning",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white)),
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
                  color: Colors.blue,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 18.0),
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search_rounded,
                            color: Colors.grey[600]),
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
          ],
        ),
      ),
    );
  }
}