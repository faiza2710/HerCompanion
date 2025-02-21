import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'package:intl/intl.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late String formattedTime;

  @override
  void initState() {
    super.initState();
    formattedTime = DateFormat.Hm().format(DateTime.now());
  }

  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  final myController = TextEditingController(text: "mahnoor.sarfraz02");

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _toggleExpand1() {
    setState(() {
      _isExpanded1 = !_isExpanded1;
    });
  }

  void _toggleExpand2() {
    setState(() {
      _isExpanded2 = !_isExpanded2;
    });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.pink,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Upload photo',
                    style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('View photo library',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Take a photo',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Container
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink.withOpacity(0.1),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.pink,
                  size: 300,
                ),
              ),
              SizedBox(height: 10),

              // Username & Edit Button
              Row(
                children: [
                  Text(
                    'noor_sarfrazzz',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditSection()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 5),

              // Bio Section
              Text(
                "Home sweet home 🏠❤️ | \nCooking enthusiast 🍳 | \nFinding joy in simple moments ✨😊.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 25),

              // Followers Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '1.2K',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '150',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Call the grid view function here
              buildImageGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageGrid() {
    // Sample image URLs
    final List<String> imageUrls = [
      'https://img.freepik.com/free-photo/young-woman-wearing-apron-holding-basin-with-cleaning-tools-looking-confident-smiling-cheerful-blue-wall_141793-13622.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',
      'https://img.freepik.com/free-photo/family-with-little-son-autumn-park_1157-22273.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',
      'https://img.freepik.com/free-photo/portrait-happy-family_23-2147841353.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',
      'https://img.freepik.com/free-photo/family-sits-row-footsteps-before-house_8353-970.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',
      'https://img.freepik.com/premium-photo/mother-father-hold-hands-little-daughter-autumn-park_261179-17.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',
      'https://img.freepik.com/premium-photo/happy-family-with-little-daughter-having-fun-walk-park_182792-802.jpg?ga=GA1.1.570367659.1695806292&semt=ais_hybrid',

    ];

    return Container(
      height: 400, // Set a fixed height for GridView
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Disable GridView's scroll
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }

  Widget EditSection() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink, // Pink background
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.white, // White text
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.pink, // Pink background
            iconTheme: IconThemeData(
              color: Colors.white, // White back button icon
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pink.withOpacity(0.1),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.pink,
                    size: 150,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      _showModalBottomSheet();
                    },
                    child: Text(
                      'Edit Photo',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 1, color: Colors.grey.shade500),
              SizedBox(height: 15),
              GestureDetector(
                onTap: _toggleExpand1,
                child: Row(
                  children: [
                    Text(
                      'Primary details',
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      _isExpanded1 ? Icons.expand_less : Icons.expand_more,
                    ),
                  ],
                ),
              ),
              if (_isExpanded1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Full name',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Display name',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Your display name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Name pronunciation',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 15),
              Divider(thickness: 1, color: Colors.grey.shade500),
              SizedBox(height: 15),
              GestureDetector(
                onTap: _toggleExpand2,
                child: Row(
                  children: [
                    Text(
                      'Contact information',
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                    ),
                  ],
                ),
              ),
              if (_isExpanded2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.lock),
                        SizedBox(width: 5),
                        Text(
                          'Email address',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'mahnoor.sarfraz02@gmail.com',
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black26, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Phone',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

}
