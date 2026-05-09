import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../utils/app_sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = context.height;
    var screenWidth = context.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/OnBoarding6.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(color: Colors.black.withValues(alpha: 0.4)),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  Image.asset(
                    'assets/images/Available Now.png',
                    width: screenWidth * 0.6,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      height: screenHeight * 0.45,
                      enlargeCenterPage: true,
                      viewportFraction: 0.75,
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/OnBoarding6.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('7.7 ', style: TextStyle(color: Colors.white)),
                                  Icon(Icons.star, color: Colors.amber, size: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Image.asset(
                    'assets/images/Watch Now.png',
                    width: screenWidth * 0.5,
                  ),

                  SizedBox(height: screenHeight * 0.03),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Action',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See More >', style: TextStyle(color: Colors.orange)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: screenHeight * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: screenWidth * 0.3,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/OnBoarding6.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}