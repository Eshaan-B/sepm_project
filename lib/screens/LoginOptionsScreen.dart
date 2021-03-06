import 'package:flutter/material.dart';
import 'LandlordLoginScreen.dart';
import 'student_login.dart';

class LoginOptionsScreen extends StatelessWidget {
  static const routeName = '/loginOptionsScreens';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset('assets/images/home1.png')
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5.0,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(StudentLoginPage.routeName);
                  },
                  minWidth: 300.0,
                  height: 42.0,
                  child: Text(
                    'Student Login',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                elevation: 5.0,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(LandlordLoginScreen.routeName);
                  },
                  minWidth: 300.0,
                  height: 42.0,
                  child: Text(
                    'Landlord Login',
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
