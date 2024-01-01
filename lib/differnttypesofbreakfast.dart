import 'package:flutter/material.dart';
import 'package:resturant/breakfastindex.dart';
import 'package:resturant/db_helper.dart';

class Breeakfast extends StatefulWidget {
  const Breeakfast({super.key});

  @override
  State<Breeakfast> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Breeakfast> {
  DBHelper dbHelper = DBHelper();
  final List<String> foodItems = [
    'Idli',
    'Dosa',
    'Puttu',
    'Pancake',
    'Smootie',
    'Porota',
    'Chapathi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Breakfast Items",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(foodItems[index]),
                  onTap: () {
                    if (foodItems[index] == 'Dosa') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductlistScreemn(),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
