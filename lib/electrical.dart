import 'package:flutter/material.dart';

class ElectricianDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ali Khan',
      'image': 'assets/images/1-e.png',  // Change image to an electrician image
      'description': 'Ali Khan is an experienced electrician with over 10 years in the industry, specializing in electrical installations, wiring, and repairs. He has worked on various residential and commercial projects, earning a reputation for reliability and efficiency.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Ahsan Akram',
      'image': 'assets/images/4-p.png',
      'description': 'Ahsan Akram is a seasoned electrician with expertise in electrical repairs, installations, and wiring for homes and businesses. Known for his problem-solving skills, Ahsan is efficient in diagnosing and fixing electrical issues.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Omar Farooq',
      'image': 'assets/images/4-p.png',  // Change image to an electrician image
      'description': 'Omar Farooq is a skilled electrician with many years of experience. He specializes in electrical wiring, installations, and fault detection. Omar is reliable and works carefully to ensure safe and effective electrical services.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Bilal Shahid',
      'image': 'assets/images/4-e.png',  // Change image to an electrician image
      'description': 'Bilal Shahid is an experienced electrician known for his expertise in electrical installations and repairs. He values customer satisfaction and delivers high-quality electrical work quickly and efficiently.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Shahbaz Anwar',
      'image': 'assets/images/6-e.png',  // Change image to an electrician image
      'description': 'Shahbaz Anwar is a skilled electrician with years of experience in residential and commercial electrical work. His attention to detail and efficient service make him a trusted professional for electrical repairs and installations.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zahid Iqbal',
      'image': 'assets/images/5-e.png',  // Change image to an electrician image
      'description': 'Zahid Iqbal is an expert electrician with vast experience in electrical installations, maintenance, and troubleshooting. He is known for his fast and reliable services.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Tahir Yaseen',
      'image': 'assets/images/8-p.png',  // Change image to an electrician image
      'description': 'Tahir Yaseen is an experienced electrician specializing in wiring, electrical repairs, and installations. He has worked on both residential and commercial electrical projects and is known for his quick and reliable services.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Asim Raza',
      'image': 'assets/images/9-p.png',  // Change image to an electrician image
      'description': 'Asim Raza is a skilled electrician with years of experience in electrical wiring, installations, and fault repairs. His professionalism and customer care ensure a safe and effective electrical system.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Naveed Ahmed',
      'image': 'assets/images/10-p.png',  // Change image to an electrician image
      'description': 'Naveed Ahmed is an experienced electrician with a specialization in electrical installations, wiring, and fault detection. Known for his prompt service and efficient work, he provides solutions to electrical problems effectively.',
      'contact': '+123 456 7891'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Electrician Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,  // Change color to blue for electrician services
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
        ),// Change color to blue for electrician services
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
              textAlign: TextAlign.justify,  // Justify the description text
            ),
            SizedBox(height: 20),
            Text(
              'Contact: $serviceContact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Booking logic for electrician service
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,  // Change color to blue for electrician services
              ),
              child: Text(
                'Book Service',
                style: TextStyle(
                  color: Colors.white, // Change this to your desired text color
                  fontSize: 16, // Optional: Adjust the font size if needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
