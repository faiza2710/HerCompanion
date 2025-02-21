import 'package:flutter/material.dart';

class BankingDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Banking", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(  // Wrap the body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.account_balance, size: 80, color: Colors.pink),
                    SizedBox(height: 10),
                    Text(
                      "Banking",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Job Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "As a Banking professional, you will be responsible for managing customer accounts, providing financial advice, and ensuring compliance with regulatory requirements. You will help clients manage their finances, assess risks, and develop solutions for their financial needs.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "Opportunities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Bank A - Remote"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Bank B - New York"),
              ),
              ListTile(
                leading: Icon(Icons.business, color: Colors.pink),
                title: Text("Bank C - London"),
              ),
              SizedBox(height: 15),
              Text(
                "Salary Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$50,000 - \$100,000 per year",
                style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Required Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Strong knowledge of financial markets and banking regulations"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Experience in risk assessment and financial planning"),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.pink),
                title: Text("Excellent communication and analytical skills"),
              ),
              SizedBox(height: 20),  // Add some extra space before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your apply action here
                  },
                  child: Text("Apply Now",style: TextStyle(color:Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
