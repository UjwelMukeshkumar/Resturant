import 'package:badges/badges.dart' as badge;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant/cartprovider.dart';
import 'package:resturant/cartscreen.dart';
import 'package:resturant/db_helper.dart';
import 'package:resturant/modelclass/cart.dart';

class ProductlistScreemn extends StatefulWidget {
  const ProductlistScreemn({super.key});

  @override
  State<ProductlistScreemn> createState() => _ProductlistScreemnState();
}

class _ProductlistScreemnState extends State<ProductlistScreemn> {
  int clickCount = 0;
  DBHelper dbHelper = DBHelper();
  List<String> productname = [
    'Masala Dosa',
    'Plane Dosa',
    'GheeRhost',
    'ThattuDosa',
  ];
  List<int> productprice = [10, 50, 40, 10, 50];
  List<String> productimage = [
    "assets/masaladosa.jpeg",
    "assets/dos.jpg",
    "assets/masaladosa.jpeg",
    "assets/dos.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    void saveData(int index) {
      print(index);
      print(index);
      print(productname[index].toString());
      print(productprice[index].toString());
      print(productprice[index]);
      print('1');

      print(productimage[index].toString());

      dbHelper!
          .insert(Cart(
              id: index,
              productid: index.toString(),
              productname: productname[index].toString(),
              productprice: productprice[index],
              initalprice: productprice[index],
              quantity: 1,
              image: productimage[index].toString()))
          .then((value) {
        print("Product is added to th Cart");
        cart.addTotalprice(double.parse(productprice[index].toString()));
        cart.addCounter(double.parse(productprice[index].toString()));
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Breakfast List',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Center(
              child: badge.Badge(
                position: badge.BadgePosition.topStart(),
                badgeAnimation: const badge.BadgeAnimation.fade(
                    animationDuration: Duration(milliseconds: 300)),
                showBadge: true,
                badgeContent: Consumer<Cartprovider>(
                  builder: (context, value, child) {
                    return Text(value.getCounter().toString(),
                        style: const TextStyle(color: Colors.white));
                  },
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cartascreen()));
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              shrinkWrap: true,
              itemCount: productname.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Image(
                                height: 100,
                                width: 100,
                                image:
                                    AssetImage(productimage[index].toString())),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  productname[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Rs.${productprice[index]}"),
                                const SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green.shade900),
                                    onPressed: () {
                                      saveData(index);
                                    },
                                    child: const Text('Add to Cart')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
