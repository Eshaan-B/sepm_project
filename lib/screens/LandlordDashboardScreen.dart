import 'package:flutter/material.dart';

import 'AddFlat.dart';

class LandlordDashboardScreen extends StatelessWidget {
  static const routeName = '/landlordDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.help_outline,
          size: 35,
        ),
      ),
      appBar: AppBar(
        title: Text('FoundIt'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                Navigator.of(context).pushNamed(AddFlatScreen.routeName);
              },
              child: Center(
                child: Text(
                  'Add new Flat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                'Your Info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
