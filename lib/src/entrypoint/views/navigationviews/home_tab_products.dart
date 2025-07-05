import 'package:fashionapp/src/model/products_model.dart';

List<Products> products = [
  Products(
    id: 3,
    title: "Converse Chuck Taylor All Star",
    price: 60.0,
    description: "The classic Chuck Taylor All Star sneaker from Converse, featuring a timeless design and comfortable fit.",
    isFeatured: true,
    clothesType: "kids",
    ratings: 4.333333333333333,
    colors: ["black", "white", "red"],
    imageUrls: [
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
    ],
    sizes: ["7", "8", "9", "10", "11"],
    createdAt: DateTime.parse("2024-06-06T07:57:45Z"),
    category: 3,
    brand: 1,
  ),
  Products(
    id: 1,
    title: "LV Trainers",
    price: 798.88,
    description: "LV Trainers blend sleek style with athletic functionality, featuring bold logos, premium materials, and comfortable designs that elevate your everyday look with a touch of luxury.",
    isFeatured: true,
    clothesType: "women",
    ratings: 4.5,
    colors: ["white", "black", "red"],
    imageUrls: [
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
    ],
    sizes: ["7", "8", "9", "10", "11"],
    createdAt: DateTime.parse("2024-06-06T07:49:15Z"),
    category: 3,
    brand: 1,
  ),
  Products(
    id: 2,
    title: "Adidas Ultraboost",
    price: 180.0,
    description: "xperience the comfort and energy return of the Ultraboost, designed for running and everyday wear.",
    isFeatured: true,
    clothesType: "unisex",
    ratings: 5.0,
    colors: ["navy", "grey", "blue"],
    imageUrls: [
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
    ],
    sizes: ["7", "8", "9", "10", "11"],
    createdAt: DateTime.parse("2024-06-06T07:55:20Z"),
    category: 3,
    brand: 1,
  ),
];
