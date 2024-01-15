import 'package:flutter/material.dart';
import 'package:usersinterface/signup.dart';
import 'package:usersinterface/services/view_cars.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      // Navigate to different pages based on the selected tab
      switch (_currentIndex) {
        case 0:
        // Navigate to CarViewPage for "View Cars" tab
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarView()),
          );
          break;
        case 1:
        // Navigate to Rented Cars page for the respective tab
        // Replace the code below with your desired navigation logic
          break;
        case 2:
        // Navigate to Available Cars page for the respective tab
        // Replace the code below with your desired navigation logic
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navigate to home page
          },
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Log Out'), value: 'logout'),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 300,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: 375,
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: [
                Container(
                  height: 400,
                  color: Colors.green,
                ),
                Positioned(
                  top: 10,
                  left: 25,
                  child: Container(
                    color: Colors.blueGrey.shade300,
                    width: 100,
                    height: 100,
                    child: Center(child: Text('Item 1')),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 160,
                  right: 160 ,

                  child: Container(
                    color: Colors.blueGrey.shade300,
                    width: 100,
                    height: 100,
                    child: Center(child: Text('Item 2')),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 300,
                  child: Container(
                    color: Colors.blueGrey.shade300,
                    width: 100,
                    height: 100,
                    child: Center(child: Text('Item 3')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'View Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Rented Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.local_taxi), label: 'Available Cars'),
        ],
      ),
    );
  }
}

class CarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car View'),
      ),
      body: Center(
        child: Text('Car View Page'),
      ),
    );
  }
}
