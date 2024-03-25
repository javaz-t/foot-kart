class FavoriteModel{
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  FavoriteModel({required this.id, required this.name, required this.imageUrl, required this.price,});
   factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id:json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
  );
  }
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name':name,
      'imageUrl':imageUrl,
      'price':price,
      
    };
  }
}