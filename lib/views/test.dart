import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe with Button Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index; // Update index saat halaman berubah
                });
              },
              children: [
                Container(
                  color: Colors.blue,
                  child: Center(
                      child: Text('Page 1',
                          style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                      child: Text('Page 2',
                          style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                      child: Text('Page 3',
                          style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pageController.animateToPage(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('View 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  _pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('View 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  _pageController.animateToPage(
                    2,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('View 3'),
              ),
            ],
          ),
          SizedBox(
              height:
                  20), // Tambahkan jarak antara tombol dan bagian bawah layar
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
