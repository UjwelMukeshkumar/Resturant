import 'package:flutter/material.dart';
import 'package:resturant/Type.dart';
import 'package:resturant/kitchen.dart';

class Productspage extends StatefulWidget {
  const Productspage({super.key});

  @override
  State<Productspage> createState() => _ProductspageState();
}

class _ProductspageState extends State<Productspage> {
  int clickCount = 0;
  bool isChecked = false;
  List<String> Items = ['Item 1', 'Item 2', 'Item3', 'Item 4', 'Item 5'];
  final List<String> assteimages = [
    'assets/image1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 249, 246),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Resturant App",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CheckboxListTile(
              title: Text("DoubleClick"),
              value: isChecked,
              onChanged: (bool? newVAlue) {
                setState(
                  () {
                    isChecked = newVAlue!;
                  },
                );
              },
            ),
            Container(
              height: 20,
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Kitchen()));
              },
              child: const Text(
                "Kitchen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(20),
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        crossAxisCount: 1,
        children: [
          InkWell(
              child: Card(
                color: Color.fromARGB(255, 205, 200, 200),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Cover image.jpg',
                      width: double.infinity,
                      height: 700,
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                      child: Center(
                        child: Text(
                          "Food \n & \n Beverages",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Type()));
              }),
          Card(
            color: Color.fromARGB(255, 234, 239, 236),
            child: Stack(
              children: [
                Image.asset(
                  'assets/bur.jpg',
                  width: double.infinity,
                  height: 700,
                  fit: BoxFit.fill,
                ),
                const Positioned(
                  child: Text(
                    "Burger",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 195, 196, 198),
            child: Stack(
              children: [
                Image.asset(
                  'assets/deserts.jpg',
                  width: double.infinity,
                  height: 700,
                  fit: BoxFit.fill,
                ),
                const Positioned(
                  child: Center(
                    child: Text(
                      "Deserts",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
