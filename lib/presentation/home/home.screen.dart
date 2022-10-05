import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final HomeController xctrl = controller;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(40 / 4),
              ),
              child: Center(
                child: Text(
                  'icon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              'HomeScreen',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(Icons.notifications_outlined),
              Align(
                child: Container(
                  width: 5,
                  height: 5,
                  margin: EdgeInsets.only(left: 12, bottom: 18),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5 / 2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(Icons.shopping_bag_outlined),
              Align(
                child: Container(
                  width: 5,
                  height: 5,
                  margin: EdgeInsets.only(left: 12, bottom: 18),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5 / 2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text('Header Area')),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ListTile(
              title: Text('Messages'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Type Text Here...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                suffixIcon: Icon(Icons.menu_open_rounded),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Slider
          Container(
            color: Colors.green.withOpacity(0.2),
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: xctrl.carouselController.value,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      // xctrl.carouselIndicatorController.value.jumpTo(
                      //   index.toDouble(),
                      // );
                      // xctrl.carouselIndicatorController.value.jumpToPage(index);
                    },
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: controller.imgList
                      .map(
                        (item) => Container(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  // Image.network(
                                  //   item,
                                  //   fit: BoxFit.fill,
                                  //   width: 1000.0,
                                  // ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 20.0,
                                      ),
                                      child: Text(
                                        'No. ${controller.imgList.indexOf(item)} image',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SmoothPageIndicator(
                  controller: xctrl.carouselIndicatorController.value,
                  count: xctrl.imgList.length,
                  onDotClicked: (index) {
                    print(index);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (xctrl.carouselIndicatorController.value.hasClients) {
                        // xctrl.carouselIndicatorController.value.jumpToPage(index);
                        // xctrl.carouselIndicatorController.value.animateToPage(
                        //   index,
                        //   duration: Duration(milliseconds: 1),
                        //   curve: Curves.easeInOut,
                        // );
                        xctrl.carouselIndicatorController.value.jumpTo(50.0);
                      } else {
                        print('failed');
                      }
                    });
                  },
                  effect: WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                  ),
                ),
              ],
            ),
          ),
          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories'),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(Icons.arrow_forward_ios_outlined),
                  icon: Text('View All'),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: xctrl.categories.map(
              (cat) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Image Here')),
                      ),
                      SizedBox(height: 6),
                      Text(cat),
                    ],
                  ),
                );
              },
            ).toList()),
          )
          // End of Categories
        ],
      ),
    );
  }
}
