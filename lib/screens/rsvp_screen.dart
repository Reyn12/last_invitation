import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../components/bottom_navbar.dart';

class RsvpScreen extends StatefulWidget {
  const RsvpScreen({Key? key}) : super(key: key);

  @override
  _RsvpScreenState createState() => _RsvpScreenState();
}

class _RsvpScreenState extends State<RsvpScreen> {
  // Data untuk tamu
  final List<Map<String, dynamic>> guestData = [
    {
      'initial': 'A',
      'name': 'Alfi Firdaus',
      'message': 'Yo Halo Pipel',
      'status': 'Hadir',
    },
    {
      'initial': 'A',
      'name': 'Agung Purnama',
      'message': 'Semoga Samawa',
      'status': 'Hadir',
    },
    {
      'initial': 'M',
      'name': 'Moch Nizwar Syafuan',
      'message': 'Yahaha si Babi Kawin',
      'status': 'Masih Ragu',
    },
    {
      'initial': 'I',
      'name': 'Iman Firmansyah',
      'message': 'Gak Bisa Datang Bro',
      'status': 'Tidak Hadir',
    },
    {
      'initial': 'A',
      'name': 'Alfi Firdaus',
      'message': 'Yo Halo Pipel',
      'status': 'Hadir',
    },
    {
      'initial': 'A',
      'name': 'Agung Purnama',
      'message': 'Semoga Samawa',
      'status': 'Hadir',
    },
    {
      'initial': 'M',
      'name': 'Moch Nizwar Syafuan',
      'message': 'Yahaha si Babi Kawin',
      'status': 'Masih Ragu',
    },
  ];

  // Counter untuk status
  int getStatusCount(String status) {
    return guestData.where((guest) => guest['status'] == status).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo-small.png',
                  height: 40,
                  color: Colors.white,
                ),
                const Text(
                  'RSVP & Ucapan',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          // Status counter
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                _buildStatusCounter(
                  getStatusCount('Hadir').toString(),
                  'Hadir',
                  Colors.green.shade100,
                ),
                _buildStatusCounter(
                  getStatusCount('Masih Ragu').toString(),
                  'Masih Ragu',
                  Colors.yellow.shade100,
                ),
                _buildStatusCounter(
                  getStatusCount('Tidak Hadir').toString(),
                  'Tidak Hadir',
                  Colors.red.shade100,
                ),
              ],
            ),
          ),

          // Guest list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: guestData.length,
              itemBuilder: (context, index) {
                final guest = guestData[index];
                return _buildGuestItem(
                  guest['initial'],
                  guest['name'],
                  guest['message'],
                  guest['status'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(currentIndex: 3),
    );
  }

  Widget _buildStatusCounter(String count, String label, Color color) {
    return Expanded(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(label, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestItem(
    String initial,
    String name,
    String message,
    String status,
  ) {
    Color statusColor;
    Color avatarColor = Colors.green;

    switch (status) {
      case 'Hadir':
        statusColor = Colors.green.shade100;
        break;
      case 'Masih Ragu':
        statusColor = Colors.yellow.shade100;
        avatarColor = Colors.green;
        break;
      case 'Tidak Hadir':
        statusColor = Colors.red.shade100;
        avatarColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey.shade100;
    }

    if (initial == 'M') {
      avatarColor = Colors.green;
    } else if (initial == 'I') {
      avatarColor = Colors.green;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 24,
              child: Text(
                initial,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Name and message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
