import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/flat_provider.dart';
import 'FlatsListScreen.dart';

class Flats extends StatelessWidget {
  static const routeName = '/flats';
  @override
  Widget build(BuildContext context) {
    List<FlatName> flatNames = Provider.of<FlatProvider>(context).flatNames;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find your flats'),
      ),
      body: ChangeNotifierProvider.value(
        value: FlatProvider(),
        child: flatNames.isEmpty
            ? Center(child: Text('No Flats to show!'))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        'https://miro.medium.com/max/4064/1*qYUvh-EtES8dtgKiBRiLsA.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: flatNames.length,
                        itemBuilder: (ctx, index) {
                          return Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(flatNames[index].name),
                              trailing: IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      FlatsListScreen.routeName,
                                      arguments: flatNames[index].name);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
