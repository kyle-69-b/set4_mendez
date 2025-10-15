import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelGuide(),
    );
  }
}

class TravelGuide extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {'place': 'Paris', 'country': 'France'},
    {'place': 'Tokyo', 'country': 'Japan'},
    {'place': 'New York', 'country': 'USA'},
    {'place': 'Sydney', 'country': 'Australia'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Guide'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          final place = destination['place']!;
          final country = destination['country']!;

          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text(place, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(country, style: TextStyle(fontSize: 16)),
              trailing: ElevatedButton(
                onPressed: () {
            
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Viewing details for $place, $country.')),
                  );
                },
                child: Text('View Details'),
              ),
              onTap: () {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You selected $place in $country!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
