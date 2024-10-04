import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';  // Import carousel_slider package

class KycPendingPage extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/iphone16.jpeg', // Replace with actual image paths
    'assets/sam.jpeg',
    'assets/realme.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: bannerImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(image, fit: BoxFit.fill),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // KYC Pending Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'KYC Pending',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'You need to provide the required documents for your account activation.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Action to upload KYC
                        print('Click Here to upload KYC documents');
                      },
                      child: Text('Click Here',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),

            // Categories (Mobile, Laptop, Camera, LED)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryIcon(context, 'Mobile', Icons.phone_android),
                  categoryIcon(context, 'Laptop', Icons.laptop),
                  categoryIcon(context, 'Camera', Icons.camera_alt),
                  categoryIcon(context, 'LED', Icons.tv),
                ],
              ),
            ),

            // Exclusive for You Section (with Grid)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'EXCLUSIVE FOR YOU',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  productCard('32% Off', 'assets/iphone.jpg'),
                  productCard('14% Off', 'assets/s21.webp'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Set current index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper method for category icons
  Widget categoryIcon(BuildContext context, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  // Helper method for product card
  Widget productCard(String discount, String imagePath) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 100),
          SizedBox(height: 8),
          Text(discount, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
