import 'package:flutter/material.dart';

class RecordsDetailsPage extends StatefulWidget {
  @override
  State<RecordsDetailsPage> createState() => _RecordsDetailsPageState();
}

class _RecordsDetailsPageState extends State<RecordsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(
        //   leading: Container(
        //       height: 35,
        //           width: 50,
        //           decoration: const BoxDecoration(
        //             color: Color(0xffE6E6FA),
        //           ),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context); 
        //         },
        //         icon: Icon(  Icons.arrow_back_ios_new,
        //               color: Colors.black,)),
        //   ),
        //   title: const Text(
        //     "Record Details",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),

        body: Column(
          children: [
         
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xffE6E6FA),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                   
                    ),
                    child: Text(
                      "Record Details",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 280,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Flea & tick treatment',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'valid',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RecordDetailsItem(
                        title: 'Record type',
                        value: 'Flea & tick treatment',
                      ),
                      RecordDetailsItem(
                        title: 'Pet',
                        value: 'Doggy',
                      ),
                      RecordDetailsItem(
                        title: 'Administration date',
                        value: 'Oct 3, 2023',
                      ),
                      RecordDetailsItem(
                        title: 'Expiration date',
                        value: 'Oct 28, 2023',
                      ),
                      RecordDetailsItem(
                        title: 'Notes',
                        value: 'notes ..',
                      ),
                      RecordDetailsItem(
                        title: 'Reminder date',
                        value: 'Oct 12, 2023 at 11:15 PM',
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 100,
                  right: 100,
                  top: -30,
                  child: Container(
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/man.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecordDetailsItem extends StatelessWidget {
  String? title;
  String? value;
  RecordDetailsItem({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '$title',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            '$value',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
