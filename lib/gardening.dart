import 'package:flutter/material.dart';

import 'electrical.dart';

class GardeningDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ali Gardener',
      'image': 'assets/images/5-p.png',  // Replace with gardener images
      'description': 'Ali Gardener specializes in lawn care and garden design with over 10 years of experience in transforming outdoor spaces.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Salman Gardener',
      'image': 'assets/images/6-p.png',
      'description': 'Salman Gardener offers expert gardening services, from planting to maintenance, making sure your garden looks its best.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zeeshan Gardener',
      'image': 'assets/images/6-e.png',  // Replace with gardener images
      'description': 'Zeeshan Gardener is an expert in landscape gardening, offering personalized designs and garden maintenance solutions.',
      'contact': '+123 456 7892'
    },
    {
      'name': 'Umar Sharif',
      'image': 'assets/images/2-p.png',  // Replace with gardener images
      'description': 'Umar Sharif provides expert services in garden planting, trimming, and maintaining healthy plants and flowers.',
      'contact': '+123 456 7893'
    },
    {
      'name': 'Hamid Raza',
      'image': 'assets/images/4-p.png',  // Replace with gardener images
      'description': 'Hamid Raza offers affordable gardening services, from lawn care to plant care, ensuring your garden thrives.',
      'contact': '+123 456 7894'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your color here
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Gardening Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change to a color suitable for gardening services
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceProfilePage(
                      serviceName: services[index]['name'],
                      serviceImage: services[index]['image'],
                      serviceDescription: services[index]['description'],
                      serviceContact: services[index]['contact'],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        services[index]['image'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      services[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
