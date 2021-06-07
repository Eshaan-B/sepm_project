import 'package:flutter/material.dart';

import 'AddFlat.dart';

class LandlordDashboardScreen extends StatelessWidget {
  static const routeName = '/landlordDashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.help_outline,
          size: 35,
        ),
      ),
      appBar: AppBar(
        title: Text('Landlord Dashboard'),
        backgroundColor: Colors.blueAccent,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/landlordDash.png'),
              fit: BoxFit.fitWidth
            ),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              Card(
                elevation: 5,
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
                elevation: 5,
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
        ),
      ),
    );
  }
}
