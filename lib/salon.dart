import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SalonServicesPage extends StatefulWidget {
  @override
  _SalonServicesPageState createState() => _SalonServicesPageState();
}

class _SalonServicesPageState extends State<SalonServicesPage> {
  final List<Map<String, dynamic>> salonServices = [
    {
      'name': 'Jugnus Saloon',
      'image': 'assets/images/jlogo.jpeg',
      'contact': '0328-6427573',
      'address': 'Kohinoor, Faisalabad',
      'rating': 4,
      'instagram': 'https://www.instagram.com/jugnus.salon.faisalabad/',
    },
    {
      'name': 'Alle-nora',
      'image': 'assets/images/alogo.jpeg',
      'contact': '0301-8666055',
      'address': 'D-Ground, Faisalabad',
      'rating': 4.5,
      'instagram': 'https://www.instagram.com/allenora.annie.official/?hl=en',
    },
    {
      'name': 'Hadiqa Kiani',
      'image': 'assets/images/hlogo.png',
      'contact': '0300-7223314',
      'address': 'East Canal Road, Faisalabad',
      'rating': 4.2,
      'instagram':
      'https://www.instagram.com/hadiqakianisalonfaisalabad/?hl=en',
    },
    {
      'name': 'Signature By Iram',
      'image': 'assets/images/slogo.png',
      'contact': '041-8547807',
      'address': 'Chen-one road, Faisalabad',
      'rating': 5,
      'instagram': 'https://www.instagram.com/signaturebyeram/?hl=en',
    },
    {
      'name': 'HollyWood Salon',
      'image': 'assets/images/hwlogo.jpeg',
      'contact': '0301-6942020',
      'address': 'Kohinoor city, Faisalabad',
      'rating': 4,
      'instagram': 'https://www.instagram.com/hollywoodsalonfsd/?hl=en',
    },
  ];

  List<bool> isFlipped = List.generate(5, (index) => false);

  // Updated launchURL method
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url); // Ensure the URL is parsed correctly
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication); // Open in external app
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Salon Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: salonServices.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isFlipped[index] = !isFlipped[index];
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: isFlipped[index]
                    ? Card(
                  key: ValueKey(true),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    title: Text('Visit Instagram',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.open_in_new, color: Colors.pink),
                    onTap: () => _launchURL(salonServices[index]['instagram']),
                  ),
                )
                    : Card(
                  key: ValueKey(false),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: Image.asset(
                      salonServices[index]['image'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(salonServices[index]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Contact: ${salonServices[index]['contact']}'),
                        Text('Address: ${salonServices[index]['address']}'),
                        SizedBox(height: 5),
                        Row(
                          children: List.generate(
                            5,
                                (indexStar) {
                              return Icon(
                                indexStar < salonServices[index]['rating']
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.orange,
                                size: 16,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
