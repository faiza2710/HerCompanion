import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'job_detail.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List jobs = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    final url = Uri.parse("https://freelancer-api.p.rapidapi.com/api/find-job");
    final response = await http.get(
      url,
      headers: {
        "x-rapidapi-key": "d1f99ded28msh8e2f4308f5810d9p18e502jsn68d2104d5321",
        "x-rapidapi-host": "freelancer-api.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey("posts")) {
        setState(() {
          jobs = data["posts"];
        });
      }
    } else {
      print("API Error: \${response.statusCode}");
    }
    print(jobs);
  }

  @override
  Widget build(BuildContext context) {
    final filteredJobs = jobs
        .where((job) => job["project-title"]?.toLowerCase().contains(query) ?? false)
        .toList();

    return Scaffold(
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
                hintText: 'Search jobs...',
                border: OutlineInputBorder(
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
            child: jobs.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              jobs[index]['project-title'] ?? "No Title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JobDetail(
                                    title: jobs[index]['project-title'] ?? "No Title",
                                    description: jobs[index]['project-description'] ?? "No Description",
                                    price: jobs[index]['project-price'] ?? "N/A",
                                    tags: jobs[index]['project-tags'] ?? "No tags",
                                    url:jobs[index]['project-link']??"no link",

                                  ),
                                ),
                              );
                            },
                            child: Text("View More"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
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