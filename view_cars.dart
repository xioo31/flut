import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarView(),
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    imagePath: 'assets/lancer.png',
                    label: 'LANCER',
                  ),
                  ContainerWidget(
                    imagePath: 'assets/civic.png',
                    label: 'Civic',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    imagePath: 'assets/mazda.png',
                    label: 'MAZDA',
                  ),
                  ContainerWidget(
                    imagePath: 'assets/skyline.png',
                    label: 'SKYLINE',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    imagePath: 'assets/suburu.png',
                    label: 'SUBURU',
                  ),
                  ContainerWidget(
                    imagePath: 'assets/supra.png',
                    label: 'SUPRA',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    imagePath: 'assets/supra.png',
                    label: 'SUPRA',
                  ),
                  ContainerWidget(
                    imagePath: 'assets/civic.png',
                    label: 'CIVIC',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  ContainerWidget({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the click action for the image here
        print('$label Clicked!');
      },
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
