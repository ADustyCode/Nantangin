import 'package:flutter/material.dart';

class CreateChallengePage extends StatelessWidget {
  const CreateChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus back button default
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya (Dashboard)
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk memposting tantangan
                print("Posting Tantangan");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5633A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Posting"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Icon untuk tambah gambar
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk memilih gambar
                print("Tambah Gambar");
              },
              child: Column(
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 50,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const SizedBox(height: 8),
                  const Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Input Nama Tantangan
            TextField(
              decoration: InputDecoration(
                labelText: "Nama Tantangan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Input Deskripsi
            TextField(
              decoration: InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman Buat Tantangan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateChallengePage(),
              ),
            );
          },
          child: const Text("Buat Tantangan"),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    ),
  );
}
