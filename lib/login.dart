//import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/user.dart';
import 'package:dio/dio.dart';

import 'liste.dart';

//import 'package:google_fonts/google_fonts.dart';
//import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "", "", "", "", "", "");
  String url = "http://localhost:8090/api/v/user";

  String _cin = '';
  String _password = '';
  Future save() async {
    // var res = await http.post(Uri.parse(url),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode({'email': user.email, 'password': user.password}));
    //print(user.cin);
    // if (res.body != null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Dashboard(

    // ),
    //       ));
    // }
  }
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    getHttp();
    //_loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 19),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(70, 0, 50, 19),
                          width: double.infinity,
                          child: Row(
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
                                'E-auth',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: const EdgeInsets.fromLTRB(10, 32, 10, 37),
                          width: 380,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.grey,
                                  offset: Offset(1, 5))
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 5, 0, 20),
                                child: const Text(
                                  'Sign in to your account',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                child: Text(' CIN:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  controller:
                                      TextEditingController(text: user.cin),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.length != 8 ||
                                        !RegExp(r'^\d+$').hasMatch(value)) {
                                      return 'CIN is invalid';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    user.cin = value;
                                  },
                                  onSaved: (value) => user.cin = value!,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black),
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                    border: OutlineInputBorder(),
                                    hintText: '12345678',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                child: Text(' Password:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black),
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                    border: OutlineInputBorder(),
                                    hintText: "********",
                                  ),
                                  controller: TextEditingController(
                                      text: user.password),
                                  validator: (value) => value!.isEmpty
                                      ? 'Password is empty!'
                                      : null,
                                  onChanged: (value) => user.password = value,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 24.0,
                                        width: 24.0,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  const Color(0xff00C8E8)),
                                          child: Checkbox(
                                              activeColor:
                                                  const Color(0xff00C8E8),
                                              value: isChecked,
                                              onChanged: _handleRemeberme),
                                        )),
                                    const Text("Remember Me",
                                        style: TextStyle(
                                            color: Color(0xff646464),
                                            fontSize: 12,
                                            fontFamily: 'Rubic')),
                                    const Text('       Forgot password?',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontFamily: 'Rubic')),
                                  ],
                                ),
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyListPage()),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()));
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "\nDon't have an account yet?",
                                      style: TextStyle(
                                          color: Color(0xff646464),
                                          fontSize: 12,
                                          fontFamily: 'Rubic'),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Sign up',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontFamily: 'Rubic'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await Dio().get('https://example.com/user/login');
      print("NOUR++++++++++++++++++++++++++++++++++++++++++++++++++++++R");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void _handleRemeberme(bool? value) {
    isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    if (kDebugMode) {
      print("Load Email");
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email") ?? "";
      var password = prefs.getString("password") ?? "";
      var remeberMe = prefs.getBool("remember_me") ?? false;

      if (kDebugMode) {
        print(remeberMe);
        print(email);
        print(password);
      }

      if (remeberMe) {
        setState(() {
          isChecked = true;
        });
        _emailController.text = email;
        _passwordController.text = password;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
