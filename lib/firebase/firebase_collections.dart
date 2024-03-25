  import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference adsRef =
      FirebaseFirestore.instance.collection('Ads Data');
  final CollectionReference logoRef =
      FirebaseFirestore.instance.collection('logoData');
  final CollectionReference productRef =
      FirebaseFirestore.instance.collection('Product Data');
   CollectionReference  favRef =   
      FirebaseFirestore.instance.collection('Favorite List');
      CollectionReference cardRef = 
      FirebaseFirestore.instance.collection('Card Data');