import 'package:flutter/material.dart';

import 'package:resturant/differnttypesofbreakfast.dart';

class Type extends StatefulWidget {
  const Type({super.key});

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/back.jpg",
              ),
              fit: BoxFit.fill),
        ),
        child: GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
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
                      'assets/lun.jpg',
                      width: double.infinity,
                      height: 700,
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                      child: Center(
                        child: Text(
                          "BreakFast",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Breeakfast(),
                  ),
                );
              },
            ),
            Card(
              color: Color.fromARGB(255, 234, 239, 236),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/lun.jpg',
                    width: double.infinity,
                    height: 700,
                    fit: BoxFit.fill,
                  ),
                  const Positioned(
                    child: Center(
                      child: Text("Lunch",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300)),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Color.fromARGB(255, 195, 196, 198),
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
                        "Dinner",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
