import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Bottom Navigation Bar
        Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              if (index == 0 && currentIndex != 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1 && currentIndex != 1) {
                Navigator.pushReplacementNamed(context, '/tamu');
              } else if (index == 3 && currentIndex != 3) {
                // Ubah dari index 2 ke index 3
                Navigator.pushReplacementNamed(context, '/rsvp');
              } else if (index == 4 && currentIndex != 4) {
                // Ubah dari index 3 ke index 4
                Navigator.pushReplacementNamed(context, '/settings');
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Dashor',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                activeIcon: Icon(Icons.people),
                label: 'Tamu',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(width: 24), // Placeholder untuk QR di tengah
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                activeIcon: Icon(Icons.book),
                label: 'RSVP',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Pengaturan',
              ),
            ],
          ),
        ),

        // QR Code Button di tengah
        Positioned(
          bottom: 45,
          top: -30,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.qr_code,
                color: Colors.white,
                size: 30,
              ), // Ukuran ikon diperbesar
              onPressed: () {
                // Aksi saat QR ditekan
              },
            ),
          ),
        ),
      ],
    );
  }
}
