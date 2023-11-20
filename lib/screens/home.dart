import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elearning_flutter/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();
  int current_index = 0;
  List<String> imageList = [
    'assets/images/0.png',
    'assets/images/1.png',
    'assets/images/2.png',
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
                flex: 3,
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * .5,
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
                        activeSize: Size(12.0, 12.0),
                        activeColor: Color.fromARGB(255, 47, 206, 238),
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
                    SizedBox(height: 20.0),
                    Text(
                      "It is a long established fact that a reader will be\ndistracted by the readable content.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ).tr(),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
                          },
                          child: Text("Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PowerGeez',
                          ),
                          ).tr(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .01, horizontal: MediaQuery.of(context).size.width * .15),
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                          child: Row(
                            children: [
                              Text("Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PowerGeez',
                              ),
                              ).tr(),
                              SizedBox(width: 2.0),
                              Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .01, horizontal: MediaQuery.of(context).size.width * .15),
                            backgroundColor: Color.fromARGB(255, 47, 206, 238),
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
