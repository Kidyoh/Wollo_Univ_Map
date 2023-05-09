import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Developed by: Group 5 Students',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const DeveloperCard(
              name: 'Solomon Emire',
              role: 'Id - 1798/12',
               imageUrl: '',
            ),
            const SizedBox(height: 10),
            const DeveloperCard(
              name: 'Kidus Yohannes',
              role: 'ID - 1210/12',
              imageUrl: '',
            ),
            const SizedBox(height: 10),
            const DeveloperCard(
              name: 'Daniel Desisa',
              role: 'ID - 0555/12',
              imageUrl: '',
            ),
            const SizedBox(height: 10),
            const DeveloperCard(
              name: 'Michael Tamirat',
              role: 'ID - 1404/12',
              imageUrl: '',
            ),
            const SizedBox(height: 10),
            const DeveloperCard(
              name: 'Tsedenya Admasu',
              role: 'ID - 1965/12',
              imageUrl: '',
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const DeveloperCard({
    Key? key,
    required this.name,
    required this.role,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(role),
          ],
        ),
      ),
    );
  }
}
