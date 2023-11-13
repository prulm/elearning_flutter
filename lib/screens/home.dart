import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current_index = 0;
  List<String> imageList = [
    'assets/images/0.jpg',
    'assets/images/1.jpg',
    'assets/images/2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 320.0,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 1,
                        onPageChanged: ((index, reason) {
                          setState(() {
                            current_index = index;
                          });
                        }),
                      ),
                      items: imageList.map((item) =>
                        Image.asset(
                                width: MediaQuery.of(context).size.width,
                                item,
                                fit: BoxFit.fill,
                              ),
                      ).toList(),
                    ),
                    DotsIndicator(
                      dotsCount: imageList.length,
                      position: current_index,
                      decorator: DotsDecorator(
                        activeSize: Size(10.0, 10.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      "Grow your creative\nskill with us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ).tr(),
                    Text(
                      "It is a long established fact that a reader will be\ndistracted by the readable content.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ).tr(),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Skip",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          ).tr(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
