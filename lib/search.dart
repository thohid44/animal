

// import 'package:animal/onBoarding.dart';
// import 'package:flutter/material.dart';

// class PageViewExample extends StatefulWidget {
//   @override
//   _PageViewExampleState createState() => _PageViewExampleState();
// }

// class _PageViewExampleState extends State<PageViewExample> {
//   int currentPage = 0;
//   PageController _controller = PageController(initialPage: 0);

//   final List<Widget> pages = [
// PageOne(),
// PageTwo(),
// PageThree()
//   ];

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PageView Example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: pages.length,
//               itemBuilder: (context, index) {
//                 return pages[index];
//               },
//               onPageChanged: (int page) {
//                 setState(() {
//                   currentPage = page;
//                 });
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               pages.length,
//               (index) => buildDotIndicator(index),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (currentPage < pages.length - 1) {
//                 _controller.nextPage(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               }
//             },
//             child: Text(currentPage == pages.length - 1 ? 'Finish' : 'Next'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildDotIndicator(int index) {
//     return Container(
//       width: 8.0,
//       height: 8.0,
     
//     );}}

