import 'package:flutter/material.dart';

class HiAnik extends StatefulWidget {
  const HiAnik({super.key});

  @override
  State<HiAnik> createState() => _HiAnikState();
}

class _HiAnikState extends State<HiAnik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(color: Colors.amber),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doggy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Row(
                          children: [
                            Icon(Icons.note),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1 record',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            print('Button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set the border radius
                            ),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add Record',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Icon(Icons.add), 
                Text(
                    'Add Pet',
                    style: TextStyle(
                   
                      fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Upcoming reminders',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
const SizedBox(height: 15,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Container(
            child: Text(
              'Flea & tick treatment',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
                    Container(
            child: Text(
              'Doggy-Oct 12, 2023 at 11:15 PM',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
                  ],
                )
,

       Container(
            child: Text(
              'This month',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
       
              ],
            ),
          )
        ],
      ),
    );
  }
}
