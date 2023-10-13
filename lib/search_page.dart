// import 'package:flutter/material.dart';



// class DropdownTextFieldDemo extends StatefulWidget {
//   @override
//   _DropdownTextFieldDemoState createState() => _DropdownTextFieldDemoState();
// }

// class _DropdownTextFieldDemoState extends State<DropdownTextFieldDemo> {
//   List<String> selectedItems = [];
//   List<String> items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   bool isDropdownOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Multi-Select Dropdown TextField'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   isDropdownOpen = !isDropdownOpen;
//                 });
//               },
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   labelText: 'Select Items',
//                   border: OutlineInputBorder(),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(selectedItems.isEmpty
//                         ? 'Select items'
//                         : selectedItems.join(', ')),
//                     Icon(Icons.arrow_drop_down),
//                   ],
//                 ),
//               ),
//             ),
//             if (isDropdownOpen)
//               Container(
//                 padding: EdgeInsets.only(top: 8.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: Wrap(
//                   children: items.map((item) {
//                     return CheckboxListTile(
//                       title: Text(item),
//                       value: selectedItems.contains(item),
//                       onChanged: (bool? value) {
//                         setState(() {
//                           if (value != null) {
//                             if (value) {
//                               selectedItems.add(item);
//                               print("Selected list $selectedItems");
//                             } else {
//                               selectedItems.remove(item);
//                             }
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle the selected items here
//                 print('Selected Items: ${selectedItems.join(', ')}');
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
