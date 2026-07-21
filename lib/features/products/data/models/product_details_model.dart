class ProductDetailsModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final int price;
  final int quantity;
  final double rating;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.price,
    required this.quantity,
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      slug: jsonData['slug'],
      description: jsonData['description'],
      photos: List.from(jsonData['photos']),
      colors: List.from(jsonData['colors']),
      sizes: List.from(jsonData['sizes']),
      price: jsonData['current_price'],
      quantity: jsonData['quantity'],
      rating: 4.9,
    );
  }
}
