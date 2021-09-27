import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constent.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  CarouselController carouselController = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> list = [
      SliderItem(
        img: "popcorn.png",
        title: "Choose A Tasty Dish",
        desc: "Order anything you want from your\n Favorite restaurant.",
      ),
      SliderItem(
        img: "Group.png",
        title: "Easy Payment",
        desc:
            "Payment made easy through debit\n card, credit card  & more ways to pay\n for your food.",
      ),
      SliderItem(
        img: "restaurant.png",
        title: "Enjoy the Taste!",
        desc:
            "Healthy eating means eating a variety\n of foods that give you the nutrients you\n need to maintain your health.",
      )
    ];

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: size.height / 2,
                  // autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              carouselController: carouselController,
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        children: [i],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? primaryColor : greyColor,
                    ),
                  ),
                );
              }).toList(),
            ),
            BottomSection(
              size: size,
              ontab: () {
                carouselController.nextPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.img,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String img;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Constants.imageAsset(img)),
        SizedBox(
          height: 37,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          style: TextStyle(
            fontSize: 16,
            color: greyColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.size,
    required this.ontab,
  }) : super(key: key);

  final Size size;
  final Function() ontab;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Constants.imageAsset("yeldown.png"),
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          bottom: 39,
          right: 40,
          // left: 182,
          //  top: 685,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: ontab,
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
                  onPrimary: Colors.black,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
