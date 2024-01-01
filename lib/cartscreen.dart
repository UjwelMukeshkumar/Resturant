import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant/cartprovider.dart';
import 'package:resturant/db_helper.dart';
import 'package:resturant/modelclass/cart.dart';

class Cartascreen extends StatefulWidget {
  const Cartascreen({Key? key}) : super(key: key);

  @override
  State<Cartascreen> createState() => _CartascreenState();
}

class _CartascreenState extends State<Cartascreen> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];
  @override
  void initState() {
    super.initState();
    context.read<Cartprovider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    // final userData = Provider.of<Userprovider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
        actions: [
          Center(
            child: badge.Badge(
              position: badge.BadgePosition.topStart(),
              badgeAnimation: const badge.BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 300)),
              badgeContent: Consumer<Cartprovider>(
                builder: (context, value, child) {
                  return Text(value.getCounter().toString(),
                      style: const TextStyle(color: Colors.white));
                },
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
            ),
            const SizedBox(
              height: 20,
              width: 20,
            ),
            FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Your cart is Empty",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Explore products and shop your \n favourite items',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                        image: AssetImage(
                                          snapshot.data![index].image
                                              .toString(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data![index].productname
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                //delete option
                                                InkWell(
                                                    onTap: () {
                                                      dbHelper?.delete(snapshot
                                                          .data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removeTotalprice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .productprice
                                                              .toString()));
                                                    },
                                                    child: Icon(Icons.delete)),
                                              ],
                                            ),
                                            Text(
                                              snapshot.data![index].productname
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "Rs.${snapshot.data![index].productprice}"),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // decremnt the quantity
                                                        InkWell(
                                                          onTap: () {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                            int price = snapshot
                                                                .data![index]
                                                                .initalprice!;
                                                            quantity--;
                                                            //increase in the quantity
                                                            int? newprice =
                                                                price *
                                                                    quantity;
                                                            if (quantity > 0) {
                                                              dbHelper!
                                                                  .updatequantity(
                                                                Cart(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!,
                                                                  productid: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                                  productname: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productname!,
                                                                  productprice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productprice!,
                                                                  initalprice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .initalprice!,
                                                                  quantity:
                                                                      quantity,
                                                                  image: snapshot
                                                                      .data![
                                                                          index]
                                                                      .image
                                                                      .toString(),
                                                                ),
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                newprice = 0;
                                                                quantity = 0;
                                                                cart.removeTotalprice(
                                                                  double.parse(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .initalprice!
                                                                        .toString(),
                                                                  ),
                                                                );
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error
                                                                    .toString());
                                                              });
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              int quantity =
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity!;
                                                              int price = snapshot
                                                                  .data![index]
                                                                  .initalprice!;
                                                              quantity++;
                                                              //increase in the quantity
                                                              int? newprice =
                                                                  price *
                                                                      quantity;
                                                              dbHelper!
                                                                  .updatequantity(
                                                                Cart(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!,
                                                                  productid: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                                  productname: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productname!,
                                                                  productprice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productprice!,
                                                                  initalprice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .initalprice!,
                                                                  quantity:
                                                                      quantity,
                                                                  image: snapshot
                                                                      .data![
                                                                          index]
                                                                      .image
                                                                      .toString(),
                                                                ),
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                newprice = 0;
                                                                quantity = 0;
                                                                cart.addTotalprice(
                                                                  double.parse(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .initalprice!
                                                                        .toString(),
                                                                  ),
                                                                );
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error
                                                                    .toString());
                                                              });
                                                            },
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .white24,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Place Order",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return const Text('data');
              },
            ),
            Consumer<Cartprovider>(
              builder: (BuildContext context, value, Widget? child) {
                return Visibility(
                  visible: value.getTotalprice().toStringAsFixed(2) == "0.00"
                      ? false
                      : true,
                  child: Column(
                    children: [
                      ReusableWidget(
                          title: "sub TotAL",
                          value: 'RS.${value.totalprice.toStringAsFixed(2)}'),
                      ReusableWidget(title: 'Discount 5%', value: r'Rs' + '20'),
                      ReusableWidget(
                          title: 'Total',
                          value:
                              r'Rs' + value.getTotalprice().toStringAsFixed(2))
                    ],
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

class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
