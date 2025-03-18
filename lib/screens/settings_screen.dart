import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Data contoh
  final String namaEvent = "Ina Amalia & Alfi Firdaus";
  final String pesanUndangan = "*Kepada Yth : ...";

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
                  'Pengaturan',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Event
            _buildSettingItem(
              "Nama Event",
              namaEvent,
              onTap: () {
                // Implementasi edit nama event
              },
            ),

            const SizedBox(height: 16),

            // Pesan Undangan
            _buildSettingItem(
              "Pesan Undangan",
              pesanUndangan,
              onTap: () {
                // Implementasi edit pesan undangan
              },
            ),

            const SizedBox(height: 16),

            // Layer Background dan Layer Sapa
            Row(
              children: [
                Expanded(
                  child: _buildImageLayerButton(
                    "Layar Background",
                    "assets/images/foto.png", // Ganti dengan path gambar yang sesuai
                    onTap: () {
                      // Implementasi layer background
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildImageLayerButton(
                    "Layar Sapa",
                    "assets/images/foto.png", // Ganti dengan path gambar yang sesuai
                    onTap: () {
                      // Implementasi layer sapa
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Akses Layer Sapa
            _buildLinkItem(
              "Akses Layer Sapa",
              "Tap Untuk Menyalin Link Layer Sapa",
              onTap: () {
                // Implementasi copy link
              },
            ),

            const SizedBox(height: 16),

            // Logout
            _buildLogoutItem(
              "Logout",
              "Keluar Dari Akun Ini",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),

            const SizedBox(height: 100),

            // Tutup button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Tutup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Menghapus bottomNavigationBar
    );
  }

  Widget _buildSettingItem(String title, String value, {VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.grey),
              onPressed: onTap,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildImageLayerButton(
    String title,
    String imagePath, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Gradient overlay untuk memastikan teks terlihat jelas
            Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            // Teks
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkItem(String title, String subtitle, {VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Text(subtitle, style: const TextStyle(fontSize: 16)),
              ),
              const Icon(Icons.copy, color: Colors.grey),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildLogoutItem(
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Text(subtitle, style: const TextStyle(fontSize: 16)),
              ),
              const Icon(Icons.logout, color: Colors.grey),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
