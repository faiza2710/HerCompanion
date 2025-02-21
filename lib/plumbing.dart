import 'package:flutter/material.dart';

class PlumbingDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Ahmad Ali',
      'image': 'assets/images/8-p.png',
      'description':
      'Ahmad Ali is an experienced plumber with over 10 years in the industry, specializing in leak repairs, pipe installation, and drain cleaning. He has worked on numerous residential and commercial projects, earning a reputation for reliability and efficiency. Ahmad is skilled at diagnosing and resolving complex plumbing issues quickly and effectively.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Yasir Mehamood',
      'image': 'assets/images/2-p.png',
      'description': 'Yasir Mehmood is a seasoned plumber with over a decade of hands-on experience in the trade. He specializes in leak repairs, pipe installations, and drain maintenance for residential and commercial properties. Known for his problem-solving skills, Ahmad can diagnose and fix complex plumbing issues efficiently. His dedication to quality work and customer satisfaction sets him apart. Ahmad consistently delivers reliable and long-lasting plumbing solutions.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Mustfa Kamran',
      'image': 'assets/images/3-p.png',
      'description': 'Mustafa Kamran is a skilled plumber with many years of experience. He is good at fixing leaks, installing pipes, and maintaining water systems. Mustafa is reliable and always works carefully. He focuses on making his customers happy with his services. People trust him because of his hard work and quality service.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Hassan Ahamd',
      'image': 'assets/images/5-p.png',
      'description': 'Hassan Ahmed is an experienced plumber with a strong background in fixing leaks and installing pipes. He is quick to solve plumbing problems and ensures the job is done right. Hassan is known for his reliable and professional service. He values customer satisfaction and works efficiently. His skills make him a trusted choice for all plumbing needs.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Muneeb-ul-Rehman',
      'image': 'assets/images/6-p.png',
      'description': 'Muneeb-ul-Rehman is a skilled plumber with years of experience in the field. He specializes in pipe installations, leak repairs, and maintaining plumbing systems. Muneeb is known for his reliable and efficient service. He is committed to delivering high-quality work to his clients. His expertise ensures that every plumbing issue is solved with care and professionalism.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Zafar Ali',
      'image': 'assets/images/7-p.png',
      'description': 'Zafar Ali is an experienced plumber with expertise in fixing leaks, installing pipes, and maintaining plumbing systems. He has worked on both residential and commercial projects. Zafar is known for his fast and efficient service. He focuses on providing high-quality plumbing solutions. Clients trust him for his reliability and professionalism.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Tahir Yaseen',
      'image': 'assets/images/4-p.png',
      'description': 'Tahir Yaseen is an experienced plumber who specializes in fixing leaks, installing pipes, and maintaining plumbing systems. He has worked on both home and business plumbing projects. Tahir is known for his fast and reliable service. He is dedicated to solving problems quickly and making sure customers are happy with his work.',
      'contact': '+123 456 7890'
    },
    {
      'name': 'Mehmood Alam',
      'image': 'assets/images/9-p.png',
      'description': 'Tahir Yaseen is a skilled plumber with years of experience in the field. He specializes in leak repairs, pipe installations, and plumbing maintenance. Tahir is known for his quick and reliable service. He works on both home and business plumbing projects. His goal is to ensure customer satisfaction with every job.',
      'contact': '+123 456 7891'
    },
    {
      'name': 'Aslam-Bin-Kamran',
      'image': 'assets/images/10-p.png',
      'description': 'Aslam-Bin-Kamran is an experienced plumber who specializes in fixing leaks and installing pipes. He has worked on various plumbing projects, both for homes and businesses. Aslam is known for his punctuality and high-quality work. He always strives to provide reliable and efficient plumbing services. Customers trust him for his professionalism and attention to detail.',
      'contact': '+123 456 7891'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Plumbing Services',style: TextStyle(color: Colors.white),),
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
              textAlign: TextAlign.justify, // Justify the description text
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
