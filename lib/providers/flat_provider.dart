import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:http/http.dart' as http;

class FlatCard {
  String id;
  int bhk, sharing;
  String address;
  double price;
  String name;
  List<Asset> images;
  String description;
  AssetImage img; //or NetworkImage
  FlatCard({this.id,
    this.bhk,
    this.sharing,
    this.price,
    this.name,
    this.img,
    this.images,
    this.description,
    this.address});
}

class FlatName {
  String name;
  String address;

  FlatName({this.name, this.address});
}

class FlatProvider with ChangeNotifier {
  List<FlatName> _flatNames = [];

  List<FlatName> get flatNames {
    return [..._flatNames];
  }

  List<FlatCard> _flatsList = [

  ];

  List<FlatCard> get flatList {
    return [..._flatsList];
  }

  void addFlatName(String name, String address) {
    _flatNames.add(FlatName(name: name, address: address));
    notifyListeners();
  }

  void addFlat(FlatCard flat) async {
    const _url = 'https://sepmproject-f0758-default-rtdb.firebaseio.com/flats.json';
    try {
      dynamic response = await http.post(_url,
          body: json.encode({
            'name': flat.name,
            'address': flat.address,
            'description': flat.description,
            'bhk': flat.bhk,
            'price': flat.price,
            'sharing':flat.sharing,
          }));
      _flatsList.add(
        FlatCard(
          id: json.decode(response.body)['name'],
          bhk: flat.bhk,
          name: flat.name,
          price: flat.price,
          images: flat.images,
          sharing: flat.sharing,
          address: flat.address,
          description: flat.description,
        ),
      );
      print(json.decode(response.body));
    }catch(error){
      print(error.toString());
    }

    notifyListeners();
  }
}
