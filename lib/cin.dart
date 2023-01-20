import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cinProblem.dart';

import 'liste.dart';
import 'user.dart';

class cin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "", "", "", "", "", "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 20),
                                  child: const Text(
                                    'Application for identity card for your child',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  child: Text('First Name of the father:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: user.firstName),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-zA-Z]+$')
                                              .hasMatch(value)) {
                                        return 'First name is invalid';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      user.firstName = value;
                                    },
                                    onSaved: (value) => user.firstName = value!,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                    decoration: const InputDecoration(
                                      errorStyle: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  child: Text('Last Name of the father:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: user.lastName),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-zA-Z]+$')
                                              .hasMatch(value)) {
                                        return 'Last name is invalid';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      user.lastName = value;
                                    },
                                    onSaved: (value) => user.lastName = value!,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                    decoration: const InputDecoration(
                                      errorStyle: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 172, 38, 29),
                                      elevation: 0,
                                    ),
                                    onPressed: () async {
                                      final result =
                                          await FilePicker.platform.pickFiles();
                                      if (result == null) return;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.upload),
                                        SizedBox(width: 8),
                                        Text('Birth certificate'),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 172, 38, 29),
                                      elevation: 0,
                                    ),
                                    onPressed: () async {
                                      final result =
                                          await FilePicker.platform.pickFiles();
                                      if (result == null) return;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.upload),
                                        SizedBox(width: 8),
                                        Text('Certificate of residence status'),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 172, 38, 29),
                                      elevation: 0,
                                    ),
                                    onPressed: () async {
                                      final result =
                                          await FilePicker.platform.pickFiles();
                                      if (result == null) return;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.upload),
                                        SizedBox(width: 8),
                                        Text('An identity photo'),
                                      ],
                                    ),
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
                                              builder: (context) =>
                                                  MyListPage()),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 182, 84, 78),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      "Submit",
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
                                                  CinProblem()));
                                    },
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "\nProblem CIN?",
                                        style: TextStyle(
                                            color: Color(0xff646464),
                                            fontSize: 12,
                                            fontFamily: 'Rubic'),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Click here',
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
      ),
    );
  }
}
