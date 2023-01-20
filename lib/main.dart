import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/mock_interceptor.dart';
import 'package:flutter_application_1/register.dart';

void main() {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://example.com',
  ));

  dio.interceptors.add(MockInterceptor());
  runApp(MaterialApp(home: WelcomePage(), debugShowCheckedModeBanner: false));
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                width: 45,
                height: 47,
                child: Image.asset('images/TunisiaFlag.png'),
              ),
              const Text(
                'Welcome to E-GOV!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Card(
            shadowColor: Colors.black,
            color: Colors.grey,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Text(
                        'Why create an account ?\n',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    WidgetSpan(
                      child: Text(
                        'Registering at the virtual counter allows you to Inform you, follow and carry out your procedures in a unique, confidential and secure space Interact directly with the administration Keep documents and supporting documents related to the procedures.\n',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    WidgetSpan(
                      child: Text(
                        'A valid email address and mobile phone number are required to create an account.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, elevation: 0),
            child: const Text(
              "Create an account",
              style: TextStyle(color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: RichText(
              text: const TextSpan(
                text: "\nAlready have an account?",
                style: TextStyle(
                    color: Color(0xff646464),
                    fontSize: 12,
                    fontFamily: 'Rubic'),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login here',
                    style: TextStyle(
                        color: Colors.red, fontSize: 12, fontFamily: 'Rubic'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
