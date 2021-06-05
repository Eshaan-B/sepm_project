import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
//import 'package:form_builder_file_picker/form_builder_file_picker.dart';

//import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'dart:async';
import 'package:multi_image_picker2/multi_image_picker2.dart';


import '../providers/flat_provider.dart';

class AddFlatScreen extends StatefulWidget {
  static const routeName = '/addFlat';

  @override
  _AddFlatScreenState createState() => _AddFlatScreenState();
}

class _AddFlatScreenState extends State<AddFlatScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';


  Widget buildGridView() {
    print("IMAGE ISSSS!!");
    print(images[0]);
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<FlatName> flatNames =
        Provider
            .of<FlatProvider>(context, listen: false)
            .flatNames;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new flat'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                print(_formKey.currentState.value);
                //check if this type of flat already exists
                if (flatNames.firstWhere(
                        (element) =>
                    element.name == _formKey.currentState.value['name'],
                    orElse: () => null) ==
                    null) {
                  Provider.of<FlatProvider>(context, listen: false).addFlatName(
                      _formKey.currentState.value['name'],
                      _formKey.currentState.value['address']);
                }
                //Make a new flatCard
                Provider.of<FlatProvider>(context, listen: false).addFlat(
                  FlatCard(
                    name: _formKey.currentState.value['name'],
                    description: _formKey.currentState.value['description'],
                    address: _formKey.currentState.value['address'],
                    bhk: int.parse(_formKey.currentState.value['bhk']),
                    images: images,
                    price: double.parse(_formKey.currentState.value['price']),
                    sharing: int.parse(_formKey.currentState.value['sharing']),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Name of Flat',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'name',
                        decoration:
                        InputDecoration(labelText: 'Enter your flat name'),
                        validator: FormBuilderValidators.required(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'address',
                        decoration: InputDecoration(
                          labelText: 'Enter your flat location',
                          suffixIcon: Icon(Icons.location_on),
                        ),
                        validator: FormBuilderValidators.required(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Add description (optional)',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                FormBuilderTextField(
                  name: 'description',
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                    children: [
                      Text(
                        'Add images of your flat',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: Text(''),
                      ),
                    ],
                ),

                Center(child: Text('Error: $_error')),
                ElevatedButton(
                  child: Text("Pick images"),
                  onPressed: loadAssets,
                ),
                if(images.length !=0) Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Expanded(
                    child: buildGridView(),
                  ),
                ),

                // FormBuilderImagePicker(
                //   name: 'images',
                //   decoration: const InputDecoration(labelText: 'Pick Photos'),
                //   maxImages: 10,
                //   validator: FormBuilderValidators.required(context),
                // ),
                Text(
                  'BHK',
                  style: TextStyle(fontSize: 20),
                ),

                FormBuilderChoiceChip(
                  alignment: WrapAlignment.spaceEvenly,
                  name: 'bhk',
                  decoration: InputDecoration(
                    labelText: 'How many BHK is the flat?',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: FormBuilderValidators.required(context),
                  options: [
                    FormBuilderFieldOption(
                      value: '2',
                      child: Text('2BHK'),
                    ),
                    FormBuilderFieldOption(
                      value: '3',
                      child: Text('3BHK'),
                    ),
                    FormBuilderFieldOption(
                      value: '4',
                      child: Text('4BHK'),
                    ),
                    FormBuilderFieldOption(
                      value: '5',
                      child: Text('5BHK'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'Sharing',
                            style: TextStyle(fontSize: 20),
                          ),
                          FormBuilderDropdown(
                            name: 'sharing',
                            items:
                            ['2', '3', '4', '5', '6', '7', '8', '9', '10']
                                .map(
                                  (sharing) =>
                                  DropdownMenuItem(
                                    value: sharing,
                                    child: Text(sharing),
                                  ),
                            )
                                .toList(),
                            validator: FormBuilderValidators.required(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sharing',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '₹',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(fontSize: 20),
                          ),
                          FormBuilderTextField(
                            name: 'price',
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.min(context, 1),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
