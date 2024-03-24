import 'package:flutter/material.dart';
import 'package:shoe_kart/model/product_details.dart';

class ProductDetailsProvider extends ChangeNotifier{
  List<ProductDetails>favoriteProduts= [];
  List<ProductDetails>addToCards= [];
   List<String>nameList=[];
  bool isFav= false;

addToFavList(ProductDetails data){
  final isFavList = favoriteProduts.contains(data);
  if(isFavList){
    favoriteProduts.remove(data);
    nameList.remove(data.name);
    notifyListeners();
    }else{
    favoriteProduts.add(data);
    nameList.add(data.name);
notifyListeners();

  }
  }

}

