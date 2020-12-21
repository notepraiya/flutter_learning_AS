import 'package:flutter/material.dart';

class BuildingLayouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/corridor-1496275-639x796.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          SectionTitle(),
          SectionButton(),
          SectionText,
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Hey, I am a Title',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'I am a Subtitle',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.lightBlue,
          ),
          Text('41'),
        ],
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColumnButton(Icons.call, 'CALL', Colors.lightGreen),
        _buildColumnButton(Icons.near_me, 'ROUTE', Colors.deepOrangeAccent),
        _buildColumnButton(Icons.share, 'SHARE', Colors.green),
      ],
    );
  }
}

Column _buildColumnButton(IconData icon, String label, Color color) {
  return Column(
    children: [
      Icon(
        icon,
        color: color,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Widget SectionText = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
