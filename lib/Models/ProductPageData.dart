import 'package:proj1/Models/CartData.dart';

class ProductPageData {
  String productDetails;
  String image;
  String rating;
  String title;
  String label;
  String description;
  int mrp;
  int price;
  int discount;

  ProductPageData({
    required this.productDetails,
    required this.image,
    required this.rating,
    required this.title,
    required this.label,
    required this.description,
    required this.mrp,
    required this.price,
    required this.discount,
  });

  factory ProductPageData.fromJson({required json}) {
    return ProductPageData(
      productDetails: json['description'],
      image: json['image'][0]['path'],
      rating: "4.5",
      title: json['menuType'],
      description: json['description'],
      mrp: json['MRP'] is String ? int.parse(json['MRP']) : json['MRP'],
      price: json['price'] is String ? int.parse(json['price']) : json['price'],
      discount: json['discount'] is String
          ? int.parse(json['discount'])
          : json['discount'],
      label: json['categoryType'],
    );
  }
}
