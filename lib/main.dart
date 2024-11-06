import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int weight = 70;
  int age = 23;
  bool isMale = true; // Variable to track the selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D9E7), // Light background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFD3D9E7),
        elevation: 0,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome 😊',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Male Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isMale = true; // When male is pressed, set male to active
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isMale ? Colors.blue : Colors.white, // Toggle color based on selection
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isMale ? Colors.blue : Colors.blue,
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          color: isMale ? Colors.white : Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: isMale ? Colors.white : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Female Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isMale = false; // When female is pressed, set male to inactive
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isMale ? Colors.white : Colors.blue, // Toggle color based on selection
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isMale ? Colors.blue : Colors.blue,
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          color: isMale ? Colors.blue : Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: isMale ? Colors.blue : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: buildInputCard('Weight', weight, () {
                    setState(() {
                      if (weight > 0) weight--;
                    });
                  }, () {
                    setState(() {
                      weight++;
                    });
                  }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: buildInputCard('Age', age, () {
                    setState(() {
                      if (age > 0) age--;
                    });
                  }, () {
                    setState(() {
                      age++;
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Height input
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Height',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Height',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 30),
            // BMI Result and Category
            const Text(
              '20.4',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Underweight',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            // Let's Go Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Let\'s Go',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the weight and age card with buttons
  Widget buildInputCard(String label, int value, VoidCallback onDecrease, VoidCallback onIncrease) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            '$value',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onDecrease,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: onIncrease,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
