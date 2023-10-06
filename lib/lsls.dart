// import 'package:flutter/material.dart';

// class OnBoardingPage extends StatefulWidget {
//   const OnBoardingPage({super.key});

//   @override
//   State<OnBoardingPage> createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 70,
//                 ),
//                 const Text(
//                   "What's your pet name?",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 300,
//                   child: const TextField(
//                     decoration: InputDecoration(
//                       hintText: "Enter you pet name",
//                       enabledBorder: UnderlineInputBorder(
//                         //<-- SEE HERE
//                         borderSide: BorderSide(width: 1, color: Colors.grey),
//                       ),
//                     ),
//                     maxLength: 25,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 const Text(
//                   "Got an invite to co-parent?",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                     height: 40,
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         boltDot(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Row(children: list.generate(list.bitLength, (index)=>Container()) ),
//                 ),
//                 Container(
//                   width: 100, // Set the desired width
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Add your button logic here
//                       print('Button pressed');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             15.0), // Set the border radius
//                       ),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//     );
//   }

//   Container boltDot() {
//     return Container(
//       margin: EdgeInsets.all(5),
//       height: 10,
//       width: 10,
//       decoration: BoxDecoration(
//           color: Colors.amber, borderRadius: BorderRadius.circular(10)),
//     );
//   }
// }
