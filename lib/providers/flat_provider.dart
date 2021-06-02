import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';


class FlatCard {
  String id;
  int bhk, sharing;
  String address;
  double price;
  String name;
  List<Asset> images;
  String description;
  AssetImage img; //or NetworkImage
  FlatCard(
      {this.id,
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
    // FlatCard(
    //     id: 'f1',
    //     bhk: 5,
    //     price: 3000,
    //     sharing: 9,
    //     name: 'Estancia',
    //     img: AssetImage('assets/images/flat1.jpg')),
    // FlatCard(
    //     id: 'f2',
    //     bhk: 2,
    //     price: 2500,
    //     sharing: 2,
    //     name: 'Adobe',
    //     img: AssetImage('assets/images/flat2.jpg')),
    // FlatCard(
    //     id: 'f3',
    //     bhk: 3,
    //     price: 2500,
    //     sharing: 6,
    //     name: 'Adobe',
    //     img: AssetImage('assets/images/flat1.jpg')),
    // FlatCard(
    //     id: 'f4',
    //     bhk: 3,
    //     price: 2500,
    //     sharing: 4,
    //     name: 'Estancia',
    //     img: AssetImage('assets/images/flat2.jpg')),
    // FlatCard(
    //     id: 'f5',
    //     bhk: 5,
    //     price: 3000,
    //     sharing: 9,
    //     name: 'Estancia',
    //     img: AssetImage('assets/images/flat1.jpg')),
    // FlatCard(
    //     id: 'f6',
    //     bhk: 2,
    //     price: 2500,
    //     sharing: 2,
    //     name: 'Adobe',
    //     img: AssetImage('assets/images/flat2.jpg')),
    // FlatCard(
    //     id: 'f7',
    //     bhk: 2,
    //     price: 2500,
    //     sharing: 2,
    //     name: 'SIS',
    //     img: AssetImage('assets/images/flat2.jpg')),
    // FlatCard(
    //     id: 'f8',
    //     bhk: 2,
    //     price: 2500,
    //     sharing: 2,
    //     name: 'SIS',
    //     img: AssetImage('assets/images/flat2.jpg')),
  ];
  List<FlatCard> get flatList {
    return [..._flatsList];
  }

  void addFlatName(String name, String address) {
    _flatNames.add(FlatName(name: name, address: address));
    notifyListeners();
  }

  void addFlat(FlatCard flat) {
    _flatsList.add(
      FlatCard(
        id: DateTime.now().toString(),
        bhk: flat.bhk,
        name: flat.name,
        price: flat.price,
        images: flat.images,
        sharing: flat.sharing,
        address: flat.address,
        description: flat.description,
      ),
    );
    notifyListeners();
  }
}
