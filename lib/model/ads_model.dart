

class AdsModel {
  final String adsUrl;

  AdsModel({required this.adsUrl});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      adsUrl: json['adsUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adsUrl': adsUrl,
    };
  }
}
