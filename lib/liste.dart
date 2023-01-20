import 'package:flutter/material.dart';
import 'package:flutter_application_1/cin.dart';
import 'package:flutter_application_1/diploma.dart';
import 'package:flutter_application_1/drivingLicense.dart';

import 'WeddingContract.dart';
import 'declarationOfBirth.dart';

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service list'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
              width: 30,
              height: 40,
              child: Image.asset('images/ring.png'),
            ),
            title: const Text('Wedding contract'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeddingContract()),
              );
            },
          ),
          ListTile(
            leading: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
              width: 30,
              height: 40,
              child: Image.asset('images/diplome.png'),
            ),
            title: const Text('Diploma'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Diploma()),
              );
            },
          ),
          ListTile(
            leading: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
              width: 30,
              height: 40,
              child: Image.asset('images/id-card.png'),
            ),
            title: const Text('CIN'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cin()),
              );
            },
          ),
          ListTile(
            leading: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
              width: 30,
              height: 40,
              child: Image.asset('images/baby.png'),
            ),
            title: const Text('Declaration of birth'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeclarationOfBirth()),
              );
            },
          ),
          ListTile(
            leading: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
              width: 30,
              height: 40,
              child: Image.asset('images/car.png'),
            ),
            title: const Text('Driving license'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle the tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => drivingLicense()),
              );
            },
          ),
        ],
      ),
    );
  }
}
