class CardData {
  String id;
  String image;
  String rating;
  String title;
  String label;
  String price;
  bool favorite;

  CardData({
    required this.id,
    required this.image,
    required this.rating,
    required this.title,
    required this.label,
    required this.price,
    required this.favorite,
  });

  factory CardData.fromJson({required json}) {
    return CardData(
      id: json['id'],
      image: json['image'][0]['path'],
      rating: "4.6",
      title: json['categoryType'],
      label: json['productTypes'],
      price: '${json['price']}',
      favorite: false,
    );
  }
}
