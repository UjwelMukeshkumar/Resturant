// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:resturant/cartscreen.dart';
// import 'package:resturant/userprovider.dart';

// class User extends StatefulWidget {
//   const User({
//     super.key,
//   });

//   get user => null;

//   @override
//   State<User> createState() => _UserState();
// }

// class _UserState extends State<User> {
//   final namecontroller = TextEditingController();
//   final mobilecontroller = TextEditingController();
//   final placecontroller = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     String name;
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Costumer Details",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Center(
//                   child: Container(
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                     child: TextFormField(
//                       controller: namecontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: "Name",
//                         hintText: "Enter the name",
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: TextFormField(
//                   controller: mobilecontroller,
//                   decoration: InputDecoration(
//                       labelText: "Moblile Number",
//                       hintText: "Enter the Mobile Number",
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue))),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: TextFormField(
//                   controller: placecontroller,
//                   decoration: const InputDecoration(
//                     labelText: "Place",
//                     hintText: "Enter the Place",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Cartascreen()));
//                   },
//                   child: Text(
//                     "Save",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )));
//   }
// }
