import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 204, 255),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text('Welcome'),
              Text('BMI Calculator'),
            ],
          ),

          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Gfds'), style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)),
              ElevatedButton(onPressed: (){}, child: Text('Gfds')),
            ],
          )
        ],

        
      ),
    );
  }
}
