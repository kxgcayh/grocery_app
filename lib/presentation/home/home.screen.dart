import 'dart:ui';

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
      body: SingleChildScrollView(
        child: Column(
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
                                    Image.network(
                                      item,
                                      fit: BoxFit.fill,
                                      width: 1000.0,
                                    ),
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
                        if (xctrl
                            .carouselIndicatorController.value.hasClients) {
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
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
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/120/130',
                              ),
                            ),
                          ),
                          // child: Center(child: Text('Image Here')),
                        ),
                        SizedBox(height: 6),
                        Text(cat),
                      ],
                    ),
                  );
                },
              ).toList()),
            ),
            // End of Categories
            SizedBox(
              height: 20,
            ),

            // Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: xctrl.category.map(
                  (cat) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.coffee,
                            )),
                          ),
                          SizedBox(height: 6),
                          Center(child: Text(cat))
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(height: 20),
            // End categories

            // Best Seller
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller Product',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: xctrl.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final data = xctrl.products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://picsum.photos/140',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 10, top: 10),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30 / 2),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.heart_broken,
                                    size: 20,
                                    color: data.whitelist
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 12,
                                      ),
                                      Text(
                                        data.location,
                                        maxLines: 1,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  data.sold != 0
                                      ? Text(
                                          '${data.sold}',
                                          style: TextStyle(
                                            overflow: TextOverflow.fade,
                                            fontSize: 12,
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                            ),
                                            Text(
                                              '${data.rating}',
                                              style: TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                data.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('Rp${data.price}'),
                                      Text('Rp${data.price}'),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.shopping_cart_checkout),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            // End Best Seller
            SizedBox(
              height: 20,
            ),

            // Featured
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ))
                    ],
                  ),
                ),
                Column(
                  children: xctrl.Foods.map((data) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 16,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://picsum.photos/100/100',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            data.subtitle,
                                            style: TextStyle(
                                              color: Colors.lightBlue.shade900,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  Text(
                                                      "${data.estimate.toString()} min"),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  Text(
                                                    data.review.toString() ==
                                                            '0'
                                                        ? 'No review'
                                                        : data.review
                                                            .toString(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child:
                                        Icon(Icons.arrow_forward_ios_outlined),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
            // End Featured
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
                            // margin: EdgeInsets.all(5.0),
                            // child: ClipRRect(
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(5.0)),
                            //   child: Stack(
                            //     children: [
                            //       Image.network(
                            //         item,
                            //         fit: BoxFit.fill,
                            //         width: 1000.0,
                            //       ),
                            //       Positioned(
                            //         bottom: 0.0,
                            //         left: 0.0,
                            //         right: 0.0,
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //             gradient: LinearGradient(
                            //               colors: [
                            //                 Color.fromARGB(200, 0, 0, 0),
                            //                 Color.fromARGB(0, 0, 0, 0)
                            //               ],
                            //               begin: Alignment.bottomCenter,
                            //               end: Alignment.topCenter,
                            //             ),
                            //           ),
                            //           padding: EdgeInsets.symmetric(
                            //             vertical: 10.0,
                            //             horizontal: 20.0,
                            //           ),
                            //           child: Text(
                            //             'No. ${controller.imgList.indexOf(item)} image',
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //               fontSize: 20.0,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: constraints.maxWidth / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      color: Colors.green,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                        right: 20,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Title'),
                                          SizedBox(height: 10),
                                          Text('Description'),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Detail'),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 15,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    width: constraints.maxWidth / 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/300/300',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
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
                        if (xctrl
                            .carouselIndicatorController.value.hasClients) {
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
            // End Slider

            SizedBox(height: 20),

            // Breakfast
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Breakfast',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.green.shade500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Breakfast is widely acknowledged to be the most important meal of the day',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/800/300'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        bottom: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30 / 2),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              Icon(
                                Icons.heart_broken,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Walnut and Nuts',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Text Bawak Kiri',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Text Bawak Kanan',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
