import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoe_kart/model/ads_model.dart';


 final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<AdsModel> fetchAdsData() async {
   final DocumentSnapshot documentSnapshot = await firestore.collection('ads').doc('adsUrl').get();
   print(documentSnapshot);
  final Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  return AdsModel.fromJson(data);
}
