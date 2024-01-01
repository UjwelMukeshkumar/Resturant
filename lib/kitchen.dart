import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant/cartprovider.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  late int Ordernumber;
  late String FetchUser;
  late String Tables;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
