import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'liste.dart';

class drivingLicense extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                                    'Lost your driving license? We are here to help you find solutions!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  child: Text(
                                      'Click on the button below to inform the administration!'),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 172, 38, 29),
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      _showSuccesDialog(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.info),
                                        SizedBox(width: 8),
                                        Text('Inform Admin'),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
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

  _showSuccesDialog(context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      body: const Center(
        child: Text(
          'Your application has been successfully transferred to the administration!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }
}
