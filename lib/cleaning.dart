import 'package:flutter/material.dart';

class CleaningDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Aisha Ahmed',
      'image': 'assets/images/1-c.png',  // Change image to a cleaning service image
      'description': 'Aisha Ahmed has over 5 years of experience in professional cleaning services. She specializes in residential and office cleaning, offering thorough and efficient cleaning solutions.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Fatima Khan',
      'image': 'assets/images/2-c.png',  // Change image to a cleaning service image
      'description': 'Fatima Khan provides exceptional cleaning services for homes and businesses. Her attention to detail ensures a spotless and hygienic environment.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Sara Malik',
      'image': 'assets/images/3-c.png',  // Change image to a cleaning service image
      'description': 'Sara Malik is a highly experienced cleaner specializing in deep cleaning services. She uses the latest tools and techniques for a sparkling clean space.',
      'contact': '+123 456 7892'
    },
    {
      'name': 'Zainab Tariq',
      'image': 'assets/images/4-c.png',  // Change image to a cleaning service image
      'description': 'Zainab Tariq offers reliable cleaning services for homes and offices. Her professional approach and dedication ensure excellent results every time.',
      'contact': '+123 456 7893'
    },
    {
      'name': 'Maryam Shah',
      'image': 'assets/images/5-c.png',  // Change image to a cleaning service image
      'description': 'Maryam Shah has expertise in both regular and deep cleaning services. She is known for her punctuality and top-notch cleaning skills.',
      'contact': '+123 456 7894'
    },
    {
      'name': 'Nida Rizwan',
      'image': 'assets/images/6-c.png',  // Change image to a cleaning service image
      'description': 'Nida Rizwan provides exceptional cleaning services, ensuring a clean and organized space. Her professional attitude makes her a favorite among clients.',
      'contact': '+123 456 7895'
    },
    {
      'name': 'Sana Yousaf',
      'image': 'assets/images/7-c-removebg-preview.png',  // Change image to a cleaning service image
      'description': 'Sana Yousaf is known for her thorough cleaning services. She ensures customer satisfaction with her exceptional attention to detail.',
      'contact': '+123 456 7896'
    },
    {
      'name': 'Hina Faisal',
      'image': 'assets/images/8-c.png',  // Change image to a cleaning service image
      'description': 'Hina Faisal specializes in cleaning services tailored to client needs. Her efficient and friendly service ensures a spotless environment.',
      'contact': '+123 456 7897'
    },
    {
      'name': 'Rabia Siddiqui',
      'image': 'assets/images/9-c.png',  // Change image to a cleaning service image
      'description': 'Rabia Siddiqui offers professional cleaning services, ensuring high standards of hygiene and cleanliness in every project.',
      'contact': '+123 456 7898'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cleaning Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change color to green for cleaning services
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
        backgroundColor: Colors.pink,  // Change color to green for cleaning services
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
                // Booking logic for cleaning service
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,  // Change color to green for cleaning services
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
