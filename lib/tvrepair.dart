import 'package:flutter/material.dart';

class TVRepairDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ali TV Repair',
      'image': 'assets/images/6-e.png',
      'description':
      'Ali has over 10 years of experience in repairing all types of TVs, including LED, LCD, and Smart TVs. Known for his quick diagnostics and reliable repairs, he ensures your TV is up and running in no time.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Yasir Electronics',
      'image': 'assets/images/9-p.png',
      'description': 'Yasir specializes in Smart TV repairs, offering excellent services with a customer-first approach. From screen replacements to software issues, he’s got you covered.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Ahmad Umair',
      'image': 'assets/images/7-p.png',
      'description': 'Yasir specializes in Smart TV repairs, offering excellent services with a customer-first approach. From screen replacements to software issues, he’s got you covered.',
      'contact': '+123 456 7891'
    },
    // Add more TV repair service details here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('TV Repair Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
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

class ServiceProfilePage extends StatelessWidget {
  final String serviceName;
  final String serviceImage;
  final String serviceDescription;
  final String serviceContact;

  const ServiceProfilePage({
    required this.serviceName,
    required this.serviceImage,
    required this.serviceDescription,
    required this.serviceContact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$serviceName Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your color here
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  serviceImage,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              serviceName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              serviceDescription,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Contact: $serviceContact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Booking logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: Text(
                'Book Service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
