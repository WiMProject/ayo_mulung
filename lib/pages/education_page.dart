import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  final List<String> tips = [
    '1. Always separate your waste into organic and inorganic.',
    '2. Compost organic waste to reduce landfill.',
    '3. Recycle materials like paper, plastic, and glass.',
    '4. Reduce single-use plastics by using reusable bags.',
    '5. Educate others about the importance of waste management.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Education')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              'Waste Management Tips',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...tips.map(
              (tip) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(tip, style: TextStyle(fontSize: 18, height: 1.4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
