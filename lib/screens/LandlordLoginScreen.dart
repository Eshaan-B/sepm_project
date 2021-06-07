import 'package:flutter/material.dart';
import 'LandlordDashboardScreen.dart';

class LandlordLoginScreen extends StatelessWidget {
  static const routeName = '/landlordLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        child: Icon(
          Icons.arrow_right_alt_rounded,
          size: 35,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LandlordDashboardScreen.routeName);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Image.asset('assets/images/home2.png')
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Landlord Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: "Enter mail id",
                  fillColor: Colors.white70,
                ),
                style: TextStyle(height: 1),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Enter Password",
                    fillColor: Colors.white70),
                style: TextStyle(height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
