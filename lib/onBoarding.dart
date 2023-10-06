import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  // declare and initizlize the page controller
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  final List<Widget> _pages = [const PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: _activePage == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        )),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 100,
            right: 100,
            height: 35,
            child: Container(
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                
                 
                  print(  _pageController.initialPage );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set the border radius
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        const Text(
          "What's your pet name?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 180,
        ),
        Container(
          width: 300,
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Enter you pet name",
              enabledBorder: UnderlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            maxLength: 25,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Got an invite to co-parent?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Continue here",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
SizedBox(height: 50,),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
                 height: 40, 
               width: 40, 
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: IconButton(onPressed: (){
                Navigator.pop(context); 
              }, icon: Icon(Icons.arrow_back_ios_new)),
            ),
          ],
        ),


        SizedBox(height: 50,), 
        Container(
       
          child: const Text(
            "What's kind of a pet do \n you have",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
   SizedBox(height: 80,), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100, 
               width: 130, 
              decoration: BoxDecoration(
                color: Colors.grey[200]
              ),
              child: Text("Dog Pic"),
            ),

             Container(
                alignment: Alignment.center,
              height: 100, 
              width: 130, 
              decoration: BoxDecoration(
              color: Colors.grey[200]
              ),
              child: Text("Dog Pic"),
            )
          ],
        )
      ],
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Page view',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
