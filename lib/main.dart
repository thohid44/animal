import 'package:animal/hi_anik_rifat.dart';
import 'package:animal/onBoarding.dart';
import 'package:animal/on_boarding.dart';
import 'package:animal/record_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageViewDemo()
    );
  }
}
class AddARecord extends StatefulWidget {
  const AddARecord({super.key});

  @override
  State<AddARecord> createState() => _AddARecordState();
}

class _AddARecordState extends State<AddARecord> {

   TextEditingController _textEditingController = TextEditingController();
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateCharCount);
  }

  void _updateCharCount() {
    setState(() {
      _charCount = _textEditingController.text.length;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
             
              padding: EdgeInsets.all(15),
               child: TextField(
                controller: _textEditingController,
                maxLength: 42,
                decoration: InputDecoration(
                  
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                  hintText: 'Hint Text',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
                       ),
             ),
          
            Container(
             
              padding: EdgeInsets.all(15),
               child: TextField(
                controller: _textEditingController,
             
                decoration: InputDecoration(
                  
                  labelText: 'Administration Date',
                  border: OutlineInputBorder(),
                  hintText: 'Oct 3, 2023',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
                       ),
             ),
                  Container(
             
              padding: EdgeInsets.all(15),
               child: TextField(
                controller: _textEditingController,
             
                decoration: InputDecoration(
                  
                  labelText: 'Expiration Date',
                  border: OutlineInputBorder(),
                  hintText: 'Oct 23, 2023',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
                       ),
             ),
              
           Container(
             
              padding: EdgeInsets.all(15),
               child: TextField(
             //   controller: _textEditingController,
                maxLength: 150,
                decoration: InputDecoration(
                  label: Text("Notes"),
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                  hintText: 'Notes',
                  
                
                ),
                maxLines: 3,
                       ),
             ),
             Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
      Container(
            width: 130, // Set the desired width
            child: ElevatedButton.icon(
              onPressed: () {
                // Add your button logic here
                print('Button pressed');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Set the border radius
                ),
              ),
              icon: Icon(Icons.camera_front),
              label: Text("Photo", 
              style: TextStyle(

              ),),
             
            ),
          ),
      ],
    ),

    Center(
          child: Container(
            width: 100, // Set the desired width
            child: ElevatedButton(
              onPressed: () {
                // Add your button logic here
                print('Button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Set the border radius
                ),
              ),
              child: Text('Save'  , style: TextStyle(
                color: Colors.white,
                fontSize: 18, 


              ),),
            ),
          ),
        ),
      
        ],
        ),
      ),
    );
  }
}