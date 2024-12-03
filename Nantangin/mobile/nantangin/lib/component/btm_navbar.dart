import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFFF5633A),
      unselectedItemColor: Colors.grey,
      onTap: onTap, // Tidak ada error lagi
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Beranda",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.group_add_outlined),
          label: "Tambah",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF5633A), // Warna tombol tengah
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          label: "Buat",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: "Cari",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profil",
        ),
      ],
    );
  }
}
