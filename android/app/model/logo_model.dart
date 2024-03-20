class BrandData {
  final List<String> brandNames;
  final List<String> brandImages;

  BrandData({required this.brandNames, required this.brandImages});

  factory BrandData.fromJson(Map<String, dynamic> json) {
    return BrandData(
      brandNames: List<String>.from(json['brandNames']),
      brandImages: List<String>.from(json['brandImages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandNames': brandNames,
      'brandImages': brandImages,
    };
  }
}

