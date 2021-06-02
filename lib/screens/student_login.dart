import 'package:flutter/material.dart';
import 'Flats.dart';

class StudentLoginPage extends StatelessWidget {
  static const routeName = '/studentLoginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.arrow_right_alt_rounded,
          size: 35,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Flats.routeName);
        },
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.network(
                'https://media-exp1.licdn.com/dms/image/C4E0BAQFQYA2aCgiJ0Q/company-logo_200_200/0/1519891277387?e=2159024400&v=beta&t=AoSOoabCk2OPLh0LxMndKfkC0jZJ2DkV1IBBHF_XbpQ',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Student Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  hintText: "Enter SRM email",
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
      )),
    );
  }
}
