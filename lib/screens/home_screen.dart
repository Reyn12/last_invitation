import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../components/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hilangkan AppBar dari sini
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // AppBar custom sebagai background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: AppColors.primary,
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo-small.png',
                    height: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Content area
          Padding(
            padding: const EdgeInsets.only(top: 350),
            child: Column(
              children: [
                // Export button and total
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.file_download,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        label: const Text(
                          'Export To Excel',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                      const Text('Total Tamu Check In : 4'),
                    ],
                  ),
                ),

                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Tamu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),

                // Guest list
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildGuestItem(
                        'N',
                        'Moch Nizwar Syafuan',
                        '22/03/2023 09.00',
                        true,
                        true,
                      ),
                      _buildGuestItem(
                        'A',
                        'Alfi Firdaus',
                        '22/03/2023 09.00',
                        true,
                        false,
                      ),
                      _buildGuestItem(
                        'N',
                        'Moch Nizwar Syafuan',
                        '22/03/2023 09.00',
                        true,
                        true,
                      ),
                      _buildGuestItem(
                        'A',
                        'Alfi Firdaus',
                        '22/03/2023 09.00',
                        true,
                        false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Card yang berada di atas AppBar
          Positioned(
            top: 130, // Sesuaikan posisi ini
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile section
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 25,
                          child: const Text(
                            'A',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'alfifirdaus0607',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Divider(height: 32),

                    // Event details
                    const Text(
                      'Nama Event',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Text(
                      'Ina Amalia & Alfi Firdaus',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Waktu Event',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Text('26 Juni 2023', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(currentIndex: 0),
    );
  }

  Widget _buildGuestItem(
    String initial,
    String name,
    String time,
    bool isCheckedIn,
    bool isVip,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Text(
                    initial,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                if (isVip)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'VIP',
                        style: TextStyle(fontSize: 8, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Checked In',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
