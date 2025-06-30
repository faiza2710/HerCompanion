
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class JobsScreen extends StatefulWidget {
//   @override
//   _JobsScreenState createState() => _JobsScreenState();
// }
//
// class _JobsScreenState extends State<JobsScreen> {
//   List<dynamic> jobs = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchJobs();
//   }
//
//   Future<void> fetchJobs() async {
//     const String url = 'https://upwork17.p.rapidapi.com/search';
//     const Map<String, String> headers = {
//       'x-rapidapi-key': 'd1f99ded28msh8e2f4308f5810d9p18e502jsn68d2104d5321',
//       'x-rapidapi-host': 'upwork17.p.rapidapi.com'
//     };
//
//     final Uri uri = Uri.parse(url).replace(queryParameters: {
//       'page': '1',
//       'perPage': '50',
//       'sort': 'relevance',
//       'hoursPerWeek': 'as_needed',
//       'projectLength': 'week',
//       'contractToHire': 'yes'
//     });
//
//     try {
//       final response = await http.get(uri, headers: headers);
//
//       if (response.statusCode == 200) {
//         final dynamic data = jsonDecode(response.body); // Decode response
//
//         print("API Response: $data"); // Debugging ke liye response print karo
//
//         if (data is List) {
//           // ✅ Agar response `List` hai to waise hi store kar do
//           setState(() {
//             jobs = data;
//             isLoading = false;
//           });
//         } else if (data is Map<String, dynamic> && data.containsKey("jobs")) {
//           // ✅ Agar `Map` hai aur `jobs` key hai, to extract karo
//           var jobData = data["jobs"];
//           if (jobData is String) {
//             jobData = jsonDecode(jobData); // ✅ String hai to list me convert karo
//           }
//           setState(() {
//             jobs = jobData as List<dynamic>;
//             isLoading = false;
//           });
//         } else {
//           throw Exception("Unexpected API response format");
//         }
//       } else {
//         throw Exception("Failed to load jobs: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Upwork Jobs")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : jobs.isEmpty
//           ? const Center(child: Text("No jobs found"))
//           : ListView.builder(
//         itemCount: jobs.length,
//         itemBuilder: (context, index) {
//           final job = jobs[index];
//           return Card(
//             child: ListTile(
//               title: Text(job["title"] ?? "No Title"),
//               subtitle: Text("Hourly Rate: ${job["hourlyRate"] ?? "N/A"}"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
