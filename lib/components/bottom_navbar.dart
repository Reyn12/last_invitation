import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacementNamed(context, '/guests');
        } else if (index == 2 && currentIndex != 2) {
          Navigator.pushReplacementNamed(context, '/rsvp');
        } else if (index == 3 && currentIndex != 3) {
          Navigator.pushReplacementNamed(context, '/settings');
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashor'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Tamu'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'RSVP'),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
    );
  }
}
