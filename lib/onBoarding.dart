// import 'package:animal/constant.dart';
// import 'package:animal/hi_anik_rifat.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class PageViewDemo extends StatefulWidget {
//   const PageViewDemo({Key? key}) : super(key: key);

//   @override
//   State<PageViewDemo> createState() => _PageViewDemoState();
// }

// class _PageViewDemoState extends State<PageViewDemo> {
//   // declare and initizlize the page controller
//   final PageController _pageController = PageController(initialPage: 0);

//   // the index of the current page
//   int _activePage = 0;

//   int currentPage = 0;
//   String dataFromPage1 = '';
  
//   final List<Widget> _pages = [PageOne(), PageTwo(), PageThree()];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Stack(
//             children: [
//               PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (int page) {
//                   setState(() {
//                     _activePage = page;
//                   });
//                 },
//                 itemCount: _pages.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return _pages[index % _pages.length];
//                 },
//               ),
//               Positioned(
//                 bottom: 50,
//                 left: 0,
//                 right: 0,
//                 height: 95,
//                 child: Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List<Widget>.generate(
//                         _pages.length,
//                         (index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: InkWell(
//                                 onTap: () {
//                                   _pageController.animateToPage(index,
//                                       duration:
//                                           const Duration(milliseconds: 300),
//                                       curve: Curves.easeIn);
//                                 },
//                                 child: CircleAvatar(
//                                   radius: 8,
//                                   backgroundColor: _activePage == index
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                               ),
//                             )),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 15,
//                 left: 100,
//                 right: 100,
//                 height: 35,
//                 child: Container(
//                   height: 30,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (currentPage < _pages.length - 1) {
//                         _pageController.nextPage(
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.redAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             10.0), // Set the border radius
//                       ),
//                     ),
//                     child: Text(
//                       currentPage == _pages.length - 1 ? 'Finish' : 'Next',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

 
// }

// class PageOne extends StatelessWidget {
//   var petName;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: lavenderColor,
//                   borderRadius: BorderRadius.circular(10)),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 20,
//                   )),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 70,
//         ),
//         const Text(
//           "What's your pet name?",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(
//           height: 180,
//         ),
//         Container(
//           width: 300,
//           child: TextField(
//             controller: petName,
//             onChanged: (value) {
//               petName.text = value;
//             },
//             decoration: InputDecoration(
//                 hintText: "Enter you pet name",
//                 enabledBorder: UnderlineInputBorder(
//                   //<-- SEE HERE
//                   borderSide: BorderSide(width: 1, color: Colors.grey),
//                 ),
//                 errorText: "Pet name can't be null!"),
//             maxLength: 25,
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Got an invite to co-parent?",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 13,
//               ),
//             ),
//             const SizedBox(
//               width: 4,
//             ),
//             Text(
//               "Continue here",
//               style: TextStyle(
//                 color: Colors.blueAccent,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 13,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
// //SizedBox(height: 50,),
//         Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: lavenderColor,
//                   borderRadius: BorderRadius.circular(10)),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 20,
//                   )),
//             ),
//           ],
//         ),

//         SizedBox(
//           height: 50,
//         ),
//         Container(
//           child: const Text(
//             "What's kind of a pet do \n you have",
//             style: TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//         SizedBox(
//           height: 80,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 100,
//               width: 130,
//               decoration: BoxDecoration(color: lavenderColor),
//               child: Text("Dog Pic"),
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 100,
//               width: 130,
//               decoration: BoxDecoration(color: lavenderColor),
//               child: Text("Cat Pic"),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

// class PageThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: lavenderColor,
//                   borderRadius: BorderRadius.circular(10)),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 20,
//                   )),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HiAnik()));
//               },
//               child: Container(
//                 margin: EdgeInsets.only(right: 20),
//                 child: const Text(
//                   "Skip",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 50,
//         ),
//         Container(
//           child: const Text(
//             "Add Picture",
//             style: TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//         SizedBox(
//           height: 80,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                   color: lavenderColor,
//                   borderRadius: BorderRadius.circular(10)),
//               child: IconButton(
//                   icon: FaIcon(FontAwesomeIcons.camera),
//                   onPressed: () {
//                     print("Pressed");
//                   }),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
