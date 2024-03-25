import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/model/card_model.dart';
import 'package:shoe_kart/model/favorate_model.dart';
import 'package:shoe_kart/model/product_details.dart';   

class ProductDetailsProvider extends ChangeNotifier{

  double productSubtotal=0;
    double totalDelivaryCharge=0;
    double total=0;
  int quantiy=1;
  int? selectedSize;

  
  List<ProductDetails>favoriteProduts= [];
  List<ProductDetails>cardsList= [];
   List<String>nameList=[];
  
  bool isFav= false;

addToFavList(ProductDetails data){
  fetchFavorite();
  final isFavList = favoriteProduts.contains(data);
  if(isFavList){
    removeFromFavorite(data.id);
    favoriteProduts.remove(data);
    nameList.remove(data.name);
    notifyListeners();
    }else{
      addtoFavorite(data.id, data.name, data.price, data.images[0]);
    favoriteProduts.add(data);
    nameList.add(data.name);
    notifyListeners();
}
  }


  removeFromCard(ProductDetails data){
    cardsList.remove(data);
    notifyListeners();
  }
  addQuality(String id,int updateQuantity){
     final docCard = cardRef.doc(id);
    docCard.set({'quality': updateQuantity++}, SetOptions(merge: true));
    print(updateQuantity++);
    notifyListeners();
  }
  removeQuality(String id,int updateQuantity){
     final docCard = cardRef.doc(id);
    docCard.set({'quality': updateQuantity--});
    print(updateQuantity--);
    quantiy--;
    notifyListeners();
  }

  addData(ProductDetails data){
    productSubtotal+=data.price;
   totalDelivaryCharge+=data.deliveryCharge;
   total = productSubtotal+totalDelivaryCharge;   
   notifyListeners();
  }

  //size color change
  sizeSelecter(int value){
    selectedSize= value;
    notifyListeners();
  }

//add to favorite 
  addtoFavorite(String id,String name,double price,String imageUrl) async {
  try{
    final docFav = favRef.doc(id);
           final favoriteListData = FavoriteModel(id: id, 
           name: name, imageUrl: imageUrl, price: price);
           final json = favoriteListData.toJson();
           await docFav.set(json);
          
  }catch (e){
    print(e);  
  }
}

//remove from favoirite
removeFromFavorite(String id){
  favRef.doc(id).delete();
}

//add to card
addToCard(String id,String name,String imageUrl,double price,String size,int quality)
async {
  try{
    final docCard = cardRef.doc(id);
           final CardListData = CardModel(id: id, name: name, imageUrl: imageUrl, price: price, size: size, quality: quality);
           final json = CardListData.toJson();
           await docCard.set(json);
           }catch (e){
    print(e);  
  }
}
//remove from card

}

