import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'acrepair.dart';
import 'carpentary.dart';
import 'gardening.dart';
import 'painting.dart';
import 'pestcontrol.dart';
import 'plumbing.dart';
import 'electrical.dart';
import 'cleaning.dart';
import 'salon.dart';
import 'tvrepair.dart';


class HomeServicesPage extends StatefulWidget {
  @override
  _HomeServicesPageState createState() => _HomeServicesPageState();
}

class _HomeServicesPageState extends State<HomeServicesPage> {
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.plumbing, 'name': 'Plumbing', 'page': PlumbingDetailsPage()},
    {'icon': Icons.electrical_services, 'name': 'Electrical', 'page': ElectricianDetailsPage()},
    {'icon': Icons.cleaning_services, 'name': 'Cleaning', 'page': CleaningDetailsPage()},
    {'icon': Icons.handyman, 'name': 'Carpentry', 'page': CarpentryDetailsPage()
     },
    {'icon': Icons.format_paint, 'name': 'Painting','page':PaintingDetailsPage() },
    {'icon': Icons.bug_report, 'name': 'Pest Control', 'page':PestControlDetailsPage()},
    {'icon': Icons.ac_unit, 'name': 'AC Repair','page':ACRepairDetailsPage()},
      {'icon': Icons.tv, 'name': 'TV Repair','page':TVRepairDetailsPage()},

      {'icon': Icons.grass, 'name': 'Gardening','page':GardeningDetailsPage()},

      {'icon': Icons.spa, 'name': 'Salon Services', 'page':SalonServicesPage()},
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.pink),
                hintText: 'Search services...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 3.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.0,
                ),
                itemCount: services
                    .where((service) =>
                    service['name'].toLowerCase().contains(query))
                    .length,
                itemBuilder: (context, index) {
                  final filteredServices = services
                      .where((service) =>
                      service['name'].toLowerCase().contains(query))
                      .toList();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          filteredServices[index]['page'],
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
                          Icon(
                            filteredServices[index]['icon'],
                            size: 50,
                            color: Colors.pink,
                          ),
                          SizedBox(height: 10),
                          Text(
                            filteredServices[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
          ),
        ],
      ),
    );
  }
}
