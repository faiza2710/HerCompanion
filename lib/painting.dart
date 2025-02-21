import 'package:flutter/material.dart';

import 'electrical.dart';

class PaintingDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ali Painter',
      'image': 'assets/images/1-e.png',  // Replace with painter images
      'description': 'Ali Painter is an expert in residential and commercial painting with over 8 years of experience. He specializes in both interior and exterior painting projects.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Salman Painter',
      'image': 'assets/images/2-p.png',
      'description': 'Salman Painter provides professional painting services, known for his attention to detail and ability to transform spaces with quality finishes.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zeeshan Artist',
      'image': 'assets/images/9-p.png',  // Replace with painter images
      'description': 'Zeeshan Artist specializes in decorative painting, offering custom designs and high-quality finishes for homes and offices.',
      'contact': '+123 456 7892'
    },
    {
      'name': 'Umar Sharif',
      'image': 'assets/images/4-p.png',  // Replace with painter images
      'description': 'Umar Sharif is a professional painter with experience in large-scale commercial projects and fine-detail residential work.',
      'contact': '+123 456 7893'
    },
    {
      'name': 'Hamid Raza',
      'image': 'assets/images/5-e.png',  // Replace with painter images
      'description': 'Hamid Raza is a seasoned painter who offers affordable and efficient painting services with a focus on customer satisfaction.',
      'contact': '+123 456 7894'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Painting Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change to a color suitable for painting services
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
