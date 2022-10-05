import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Rx<CarouselController> carouselController;
  late Rx<PageController> carouselIndicatorController;

  final RxList<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ].obs;

  final RxList<String> categories = List<String>.generate(
    10,
    (index) => 'Category-$index',
  ).toList().obs;

  final RxList<String> category =
      ['Coffee', 'Restaurant', 'Clinic', 'Beauty', 'Hobbys'].obs;

  final RxList<ProductModel> products = [
    ProductModel(
      name: 'Denim Jeans Premium',
      price: '150.000',
      sold: 0,
      rating: 4.5,
      location: 'Indonesia, Jawa Barat',
      whitelist: true,
    ),
    ProductModel(
      name: 'Denim Jeans Premium',
      price: '150.000',
      sold: 128,
      location: 'Indonesia, Jawa Barat',
      whitelist: false,
    ),
    ProductModel(
      name: 'Denim Jeans Premium',
      price: '150.000',
      sold: 0,
      rating: 4.5,
      location: 'Indonesia, Jawa Barat',
      whitelist: false,
    ),
    ProductModel(
      name: 'Denim Jeans Premium',
      price: '150.000',
      sold: 0,
      rating: 4.5,
      location: 'Indonesia, Jawa Barat',
      whitelist: true,
    ),
  ].obs;

  final RxList<FoodModel> Foods = [
    FoodModel(
      title: 'Adobong Manok sa Ganta',
      subtitle: 'Main Dish',
      estimate: 2.3,
      review: 0,
    ),
    FoodModel(
      title: 'Adobong Manok sa Ganta',
      subtitle: 'Main Dish',
      estimate: 2.3,
      review: 0,
    ),
    FoodModel(
      title: 'Adobong Manok sa Ganta',
      subtitle: 'Main Dish',
      estimate: 2.3,
      review: 0,
    ),
    FoodModel(
      title: 'Adobong Manok sa Ganta',
      subtitle: 'Main Dish',
      estimate: 2.3,
      review: 0,
    ),
  ].obs;

  final List<Carousel2Model> slider = [
    Carousel2Model(
      imageUrl: 'https://picsum.photos/200/300',
      title: 'Your monioure',
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    )
  ];

  @override
  void onInit() {
    carouselController = CarouselController().obs;
    carouselIndicatorController = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    ).obs;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class ProductModel {
  const ProductModel({
    required this.name,
    required this.price,
    this.discount,
    required this.sold,
    this.whitelist = false,
    required this.location,
    this.rating = 0.0,
  });
  final String name;
  final String price;
  final String? discount;
  final int sold;
  final bool whitelist;
  final String location;
  final double rating;
}

class FoodModel {
  const FoodModel({
    required this.title,
    required this.subtitle,
    required this.estimate,
    required this.review,
  });
  final String title;
  final String subtitle;
  final double estimate;
  final int review;
}

class Carousel2Model {
  const Carousel2Model({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  final String imageUrl;
  final String title;
  final String description;
}
