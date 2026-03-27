import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          // Constraints make it look like a phone on the web
          constraints: const BoxConstraints(maxWidth: 350),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- WORKABLE PROFILE PHOTO ---
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xFFE1D5F5), // Purple border
                    child: CircleAvatar(
                      radius: 66,
                      backgroundImage: NetworkImage(
                        'assets/download.png', // Real live image link
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Alex Johnson',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.email, "Email"),
                      const SizedBox(width: 20),
                      _buildSocialIcon(Icons.phone, "Phone"),
                      const SizedBox(width: 20),
                      _buildSocialIcon(Icons.share, "Share"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to keep code clean
  Widget _buildSocialIcon(IconData icon, String label) {
    return IconButton(
      icon: Icon(icon, color: Colors.black87),
      onPressed: () => print("$label pressed"),
    );
  }
}
