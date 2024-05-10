import 'dart:async';

import 'package:flutter/material.dart';

class MentalHealthAdsCarousel extends StatefulWidget {
  @override
  _MentalHealthAdsCarouselState createState() => _MentalHealthAdsCarouselState();
}

class _MentalHealthAdsCarouselState extends State<MentalHealthAdsCarousel> {
  final List<String> ads = [
    "Take care of your mind. It's important for your overall well-being.",
    "Mental health is just as important as physical health. Don't ignore it.",
    "Prioritize self-care. Your mental health matters.",
    "Talk about your feelings. It's okay not to be okay.",
  ];

  late PageController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_controller.page == ads.length - 1) {
        _controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set the height of the container
      child: PageView.builder(
        controller: _controller,
        itemCount: ads.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color(0xff881736),
                          Color(0xff281537)
                        ])),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ads[index],
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}