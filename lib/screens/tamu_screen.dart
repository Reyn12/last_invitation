import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../components/bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TamuScreen extends StatefulWidget {
  const TamuScreen({super.key});

  @override
  _TamuScreenState createState() => _TamuScreenState();
}

class _TamuScreenState extends State<TamuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo-small.png', height: 30),
            const SizedBox(width: 8),
            const Text('LastInvitation'),
            const Text(' Tamu', style: TextStyle(fontWeight: FontWeight.w300)),
          ],
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter tabs
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(4),
                      ),
                    ),
                    child: const Center(child: Text('Tamu Mempelai Pria | 3')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(4),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Tamu Mempelai Wanita | 10',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Tamu...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // Guest list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildGuestCard(1, 'Alfi Firdaus', 'Tasikmalaya', true, false),
                _buildGuestCard(2, 'Nizwar Syafuan', 'Kalimantan', false, true),
                _buildGuestCard(3, 'Ari Sawali', 'Bandung', true, false),
              ],
            ),
          ),

          // Add buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.contacts, size: 18),
                    label: const Text('Tambah Dari Kontak'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add, size: 18),
                    label: const Text('Tambah Manual'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(currentIndex: 1),
    );
  }

  Widget _buildGuestCard(
    int number,
    String name,
    String location,
    bool hasWhatsapp,
    bool isCheckedIn,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Number circle
            CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text(
                '$number',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            // Name and location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Action buttons
            if (hasWhatsapp)
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
            if (isCheckedIn)
              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green),
                onPressed: () {},
              ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
