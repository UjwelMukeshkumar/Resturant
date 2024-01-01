import 'package:flutter/material.dart';
import 'package:resturant/db_helper.dart';
import 'package:resturant/modelclass/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartprovider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0.0;
  double get totalprice => _totalprice;
//cart Screen
  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setprefitems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', -counter);
    prefs.setDouble('total_price', _totalprice);
    notifyListeners();
  }

  void getprefsitems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalprice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalprice(double productprice) {
    _totalprice = _totalprice + productprice;
    _setprefitems();
    notifyListeners();
  }

  void removeTotalprice(double productprice) {
    _totalprice = _totalprice - productprice;
    _setprefitems();
    notifyListeners();
  }

  double getTotalprice() {
    getprefsitems();
    return _totalprice;
  }

  void addCounter(double parse) {
    _counter++;
    _setprefitems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setprefitems();
    notifyListeners();
  }

  int getCounter() {
    getprefsitems();
    return _counter;
  }
}
