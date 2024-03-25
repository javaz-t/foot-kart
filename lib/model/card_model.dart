
class CardModel{
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String size;
  final int quality;

  CardModel( {required this.id, required this.name, required this.imageUrl, required this.price, required this.size,required this.quality,});
   factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id:json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      size: json['size'],
      quality:json['quality']
      
    );
  }
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name':name,
      'imageUrl':imageUrl,
      'price':price,
      'size':size,
      'quality':quality
    };
  }
}