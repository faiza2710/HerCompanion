import 'package:flutter/material.dart';

import 'cleaning.dart';

class PestControlDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ali Pest Control',
      'image': 'assets/images/1-e.png',  // Replace with pest control images
      'description': 'Ali Pest Control offers expert solutions for termite, rodent, and insect infestations, with over 10 years of experience.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Salman Khan',
      'image': 'assets/images/2-p.png',
      'description': 'Salman Exterminators specialize in environmentally-friendly pest control methods for both residential and commercial properties.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zeeshan Ahmad',
      'image': 'assets/images/9-p.png',  // Replace with pest control images
      'description': 'Zeeshan Pest Solutions provide comprehensive pest management services, ensuring a pest-free environment.',
      'contact': '+123 456 7892'
    },
    {
      'name': 'Umar Ali',
      'image': 'assets/images/4-p.png',  // Replace with pest control images
      'description': 'Umar Pest Management offers quick and effective pest control services for homes and businesses.',
      'contact': '+123 456 7893'
    },
    {
      'name': 'Hamid Pest Control',
      'image': 'assets/images/5-e.png',  // Replace with pest control images
      'description': 'Hamid Pest Control is known for reliable and affordable pest control services with long-lasting results.',
      'contact': '+123 456 7894'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pest Control Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change to a color representing pest control theme
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your color here
          onPressed: () => Navigator.pop(context),
        ),
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
