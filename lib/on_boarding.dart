

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

// class OnBoarding extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       home: OnBoardingSlider(
//         headerBackgroundColor: Colors.white,
//         finishButtonText: 'Register',
//         finishButtonStyle: FinishButtonStyle(
         
//         ),
//         skipTextButton: Text('Skip'),
//         trailing: Text('Login'),
//         background: [
//           Image.asset('assets/slide_1.png'),
//           Image.asset('assets/slide_2.png'),
//         ],
//         totalPage: 2,
//         speed: 1.8,
//         pageBodies: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 480,
//                 ),
//                 Text('Description Text 1'),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               children: <Widget>[
//                  const SizedBox(
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
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }