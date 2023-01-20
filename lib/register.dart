import 'dart:convert';
import 'dart:core';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "", "", "", "", "", "");

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String url = "http://localhost:8080/register";
  String _errorMessage = '';
  /*Future save() async {
    // var res = await http.post(Uri.parse(url),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode({'ID': user.ID, 'password': user.password}));
    // print(res.body);
    // if (res.body != null) {
    //   Navigator.pop(context);
    // }
  }
*/

  bool isValidDob(String dob) {
    try {
      DateTime.parse(dob);
      return true;
    } catch (e) {
      return false;
    }
  }

  TextEditingController dateInput = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      @override
      void initState() {
        dateInput.text = ""; //set the initial value of text field
        super.initState();
      }

      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 54, 67, 244);
      }
      return Colors.blue;
    }

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
                                // tunisiaflag1WfY (1:20)
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
                      Container(
                        //0, 0, 10, 0
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 32, 15, 34),
                        width: 700, // ici !!!
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
                              // (14, 0, 0, 37
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 20),
                              child: const Text(
                                'Create New Account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              child: Text(' First Name:'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.firstName),
                                onChanged: (val) {
                                  user.firstName = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                    return 'First Name is invalid';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  hintText: 'Flen',
                                ),
                              ),
                            ),
                            const SizedBox(
                              child: Text(' Last Name:'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.lastName),
                                onChanged: (val) {
                                  user.lastName = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                    return 'Last Name is invalid';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  hintText: 'Fouleni',
                                ),
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
                                onChanged: (val) {
                                  user.cin = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.length != 8 ||
                                      !RegExp(r'^\d+$').hasMatch(value)) {
                                    return 'CIN is invalid';
                                  }
                                  return null;
                                },
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
                                controller:
                                    TextEditingController(text: user.password),
                                onChanged: (val) {
                                  user.password = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is empty!'; //check this !!!!
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  hintText: "********",
                                ),
                              ),
                            ),
                            const SizedBox(
                              child: Text(' Email:'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.email),
                                onChanged: (val) {
                                  user.email = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
                                          .hasMatch(value)) {
                                    return 'Email is invalid';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  hintText: 'flen.fouleni@gmail.com',
                                ),
                              ),
                            ),
                            const SizedBox(
                              child: Text(' Date Of Birth:'),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                height: MediaQuery.of(context).size.width / 3,
                                child: Center(
                                    child: TextField(
                                  controller: dateInput,
                                  //editing controller of this TextField
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      //formatted date output using intl package =>  2021-03-16
                                      setState(() {
                                        dateInput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
                                ))),
                            const SizedBox(
                              child: Text(' Phone Number:'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.phone),
                                onChanged: (val) {
                                  user.phone = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.length != 12 ||
                                      !RegExp(r'^\+216\d+$').hasMatch(value)) {
                                    return 'Phone Number is invalid';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  hintText: '+216 22 155 888',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor: const Color(
                                                0xff00C8E8) // Your color
                                            ),
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  getColor),
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                      )),
                                  const SizedBox(width: 10.0),
                                  RichText(
                                    text: const TextSpan(
                                      text: "I accept the ",
                                      style: TextStyle(
                                          color: Color(0xff646464),
                                          fontSize: 12,
                                          fontFamily: 'Rubic'),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Terms and Conditions',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontFamily: 'Rubic'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    _showSuccesDialog(context);
                                    /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );*/
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red, elevation: 0),
                                child: const Text(
                                  "Create an account",
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
                                          builder: (context) => const Login()));
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
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _showSuccesDialog(context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      body: const Center(
        child: Text(
          'Your account has been successfully created!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }
}
