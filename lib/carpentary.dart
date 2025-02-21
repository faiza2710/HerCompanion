import 'package:flutter/material.dart';

import 'cleaning.dart';

class CarpentryDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Asad Carpenter',
      'image': 'assets/images/1-e.png',  // Replace with carpenter images
      'description': 'Asad Carpenter is an expert in custom woodwork and furniture repairs, with over 10 years of experience in residential and commercial carpentry.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Salman Khan',
      'image': 'assets/images/2-p.png',
      'description': 'Salman Khan specializes in designing and building wooden furniture, offering professional and reliable carpentry services.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zeeshan Ali',
      'image': 'assets/images/9-p.png',  // Replace with carpenter images
      'description': 'Zeeshan Ali provides top-notch carpentry services, including furniture assembly, cabinet making, and wood restoration.',
      'contact': '+123 456 7892'
    },
    {
      'name': 'Umar Sharif',
      'image': 'assets/images/4-p.png',  // Replace with carpenter images
      'description': 'Umar Sharif is a professional carpenter with expertise in custom furniture and home woodwork repairs.',
      'contact': '+123 456 7893'
    },
    {
      'name': 'Hamid Raza',
      'image': 'assets/images/5-e.png',  // Replace with carpenter images
      'description': 'Hamid Raza specializes in modern carpentry solutions, providing efficient and reliable woodworking services.',
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
        title: Text('Carpentry Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change color to represent carpentry theme
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
