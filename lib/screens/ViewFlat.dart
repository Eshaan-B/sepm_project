import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../providers/flat_provider.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class ViewFlat extends StatefulWidget {
  static const routeName = "/viewFlatScreen";

  @override
  _ViewFlatState createState() => _ViewFlatState();
}

class _ViewFlatState extends State<ViewFlat> {
  FlatCard flat;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      flat = ModalRoute.of(context).settings.arguments;
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flat.name),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/flat2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '₹ ${flat.price.toString()}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'BHK',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      flat.bhk.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Sharing',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      flat.bhk.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
          ),
          Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            flat.description,
            style: TextStyle(color: Colors.grey),
          ),
          Divider(
            height: 20,
          ),
          Text(
            'Owner details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nAncidunt nulla sem eu lorem. Fusce tempor id ipsum sed ornare. Ut a diam libero. Pellentesque hendrerit felis sed interdum sollicitudin. Vivamus consectetur nisi et interdum laoreet. Suspendisse aliquet non libero id porttitor.\n Ut ut dui a dui lacinia cursus. Cras in fermentum felis, ac ultricies purus.\n\n Praesent nulla nibh, consectetur at convallis at, varius quis diam. Sed tincidunt est turpis, vitae dictum nisl pharetra vitae. Nulla congue diam justo, eu ornare augue dictum eu.",
            style: TextStyle(color: Colors.grey),
          ),
          Divider(
            height: 20,
          ),
          Text(
            "Images",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: flat.images.length,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 200,
                  width: 125,
                  child: AssetThumb(
                      height: 200, width: 125, asset: flat.images[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
