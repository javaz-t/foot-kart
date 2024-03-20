class TodoModelClass {
  String id;
  final String title;
  final String subtitle;
  final String imageUrl;

  // Constructor
  TodoModelClass( { this.id = '', required this.title, required this.subtitle,required this.imageUrl,});

  // Method to convert TodoModelClass object to JSON
  Map<String, dynamic> toFirebase() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imageUrl':imageUrl
    };
  }

  // Method to create a TodoModelClass object from JSON
  TodoModelClass.fromFirebase(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        subtitle = json['subtitle'] ?? '',
        imageUrl=json['imageUrl']??'';

// Note: In the fromJson method, the ?? operator is used to provide default values in case the key is not found in the JSON.
}