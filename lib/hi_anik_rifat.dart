import 'package:flutter/material.dart';

class HiAnik extends StatefulWidget {
  const HiAnik({super.key});

  @override
  State<HiAnik> createState() => _HiAnikState();
}

class _HiAnikState extends State<HiAnik> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hi Anik Rifet!"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
            const  SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      height: 130,
                      decoration: BoxDecoration(color: Colors.amber),
                    ),
                    Container(
                          height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const    Text(
                            'Doggy',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                      const    SizedBox(
                            height: 5,
                          ),
                          Container(
                             padding: EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                  color: Color(0xffE6E6FA), 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5) ,
                    topRight: Radius.circular(5)
                  )
                ),
                            child: const Row(
                              children: [
                                Icon(Icons.note , size: 20 , ),
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
                             const    SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                  color: Color(0xffE6E6FA), 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5) ,
                    topRight: Radius.circular(5)
                  )
                ),
                            child: const Row(
                              children: [
                                Icon(Icons.notifications, 
                                size: 20,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '1 remember',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,), 
                          Container(
                              height: 30,
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
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              label:const Text(
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
              const SizedBox(height: 25,),
              Container(
                child:const Row(
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
              const SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                child:const Text(
                  'Upcoming reminders',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
        const SizedBox(height: 30,),
              Container(
                height: 80, 
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xffE6E6FA), 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15) ,
                    topRight: Radius.circular(15)
                  )
                ),
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
                    fontSize: 13,
                  ),
                ),
              ),
                      ],
                    )
        ,
        
           Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white
            ),
                child: Text(
                  'This month',
                  style: TextStyle(
                    color: Color(0xffE6E6FA),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
           
                  ],
                ),
              ), 
         const     Divider(
                height: 1,
                color: Colors.white,
              ), 
              Container(
                height: 80, 
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xffE6E6FA), 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15) ,
                    bottomRight: Radius.circular(15)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 120,
                         decoration: const BoxDecoration(
              color: Colors.white
            ),
                      child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.abc), 
                          Text(
                  'Complete',
                  style: TextStyle(
                    color: Color(0xffE6E6FA),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                        ],
                      ),
                    ),
    
    
                      Container(
                      alignment: Alignment.center,
                      width: 120,
                       height: 40,
                         decoration: const BoxDecoration(
              color: Colors.white
            ),
                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.abc), 
                          Text(
                  'Complete',
                  style: TextStyle(
                    color: Color(0xffE6E6FA),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                        ],
                      ),
                    ),
    
    
                   
                  ],
                ),
                ), 
    
    
    
            ],
          ),
        ),
      ),
    );
  }
}
