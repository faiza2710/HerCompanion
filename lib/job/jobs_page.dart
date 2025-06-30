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

  String _filteredTitle(String? rawTitle) {
    if (rawTitle == null || rawTitle.trim().isEmpty) return "No Title";

    String cleaned = rawTitle.toLowerCase();

    // Remove unwanted words/phrases
    cleaned = cleaned.replaceAll("6 days left", "");
    cleaned = cleaned.replaceAll("verified", "");
    cleaned = cleaned.replaceAll(RegExp(r"\s+"), " ").trim();

    // ✅ If it's still empty after cleaning
    if (cleaned.isEmpty) return "No Title";

    // Capitalize the first letter only (simpler & safer than splitMapJoin)
    return cleaned[0].toUpperCase() + cleaned.substring(1);
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
      print("API Error: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter jobs based on query
    final filteredJobs = jobs
        .where((job) => job["project-title"]?.toLowerCase().contains(query) ?? false)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
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
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Pink border when not focused
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Pink border when focused
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
                itemCount: filteredJobs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        color: Colors.black, // ✅ Pink border
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job Title
                          Text(
                            _filteredTitle(filteredJobs[index]['project-title']),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Job Price or Tags (Optional: use tags/price nicely formatted)
                          if (filteredJobs[index]['project-tags'] != null)
                            Text(
                              "Tags: ${filteredJobs[index]['project-tags']}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),

                          const SizedBox(height: 16),

                          // View More Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      title: filteredJobs[index]['project-title'] ?? "No Title",
                                      description: filteredJobs[index]['project-description'] ?? "No Description",
                                      price: filteredJobs[index]['project-price'] ?? "N/A",
                                      tags: filteredJobs[index]['project-tags'] ?? "No tags",
                                      url: filteredJobs[index]['project-link'] ?? "No link",
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios, size: 16),
                              label: const Text("View More"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                foregroundColor: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                textStyle: const TextStyle(fontSize: 14),
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
