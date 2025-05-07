import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/category_card.dart';
import 'todo_page.dart';
import 'rewards_page.dart';
import 'education_page.dart';
import 'organik_page.dart';
import 'anorganik_page.dart';
import 'daur_ulang_page.dart';

class HomePage extends StatelessWidget {
  final List<Category> categories = [
    Category(
      'Organik',
      'https://cdn-icons-png.flaticon.com/512/2907/2907007.png',
      OrganikPage(),
    ),
    Category(
      'Anorganik',
      'https://cdn-icons-png.flaticon.com/512/3064/3064197.png',
      AnorganikPage(),
    ),
    Category(
      'Daur Ulang',
      'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      DaurUlangPage(),
    ),
    Category(
      'To-Do List',
      'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      TodoListPage(),
    ),
    Category(
      'Rewards',
      'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      RewardsPage(),
    ),
    Category(
      'Education',
      'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      EducationPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AYO MULUNG!')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang Di Aplikasi Kebersihan Lingkungan!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green[900],
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(category: categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
