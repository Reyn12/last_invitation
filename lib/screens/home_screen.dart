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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo-small.png',
              height: 40,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 47), // Tambahkan margin kiri
              child: const Text(
                'Dashbor',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        toolbarHeight: 80,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
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
                const Text('alfifirdaus0607', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          // Event details
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

          // Export button and total
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download, size: 18),
                  label: const Text('Export To Excel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
                const Text('Total Tamu Check In : 4'),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Tamu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // Guest list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Text(
                        index % 2 == 0 ? 'A' : 'N',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      index % 2 == 0 ? 'Alfi Firdaus' : 'Moch Nizwar Syafuan',
                    ),
                    subtitle: const Text('22/03/2023 09:00'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Checked In',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(currentIndex: 0),
    );
  }
}
