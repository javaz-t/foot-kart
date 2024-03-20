class LogoModelClass {
  final String id;
  final String logoName;
  final String logoUrl;
  LogoModelClass({required this.id , required this.logoName, required this.logoUrl});

  // fromJson method
  factory LogoModelClass.fromJson(Map<String, dynamic> json) {
    return LogoModelClass(
      id: json['id'],
      logoName: json['logoName'],
      logoUrl: json['logoUrl'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logoName': logoName,
      'logoUrl': logoUrl,
    };
  }
}
