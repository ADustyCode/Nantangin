import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset("images/logo.png",
            height: 225, width: 225, fit: BoxFit.fitWidth),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Populer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Populer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("lihat semua", style: TextStyle(color: Color(0xFFF5633A))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPopularCard(
                      image: "images/pushup.jpg",
                      title: "Push Up 100 kali dalam sehari",
                      subtitle:
                          "Lu belum keren kalo belum push up 100 kali sehari!",
                      username: "Nanskuy",
                      participants: 13,
                    ),
                    const SizedBox(width: 10),
                    _buildPopularCard(
                      image: "images/pushup.jpg",
                      title: "Chin Up 100 kali dalam sehari",
                      subtitle:
                          "Lu belum keren kalo belum chin up 100 kali sehari!",
                      username: "Nanskuy",
                      participants: 8,
                    ),
                    const SizedBox(width: 10),
                    _buildPopularCard(
                      image: "images/pushup.jpg",
                      title: "Pull Up 100 kali dalam sehari",
                      subtitle:
                          "Lu belum keren kalo belum pull up 100 kali sehari!",
                      username: "Nanskuy",
                      participants: 7,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Section Terkini
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Terkini",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("lihat semua", style: TextStyle(color: Color(0xFFF5633A))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(3, (index) {
                  return _buildRecentCard(
                    image: "images/pushup.jpg",
                    title: "Bersihkan sampah di depan rumah",
                    hashtag: "#PeduliLingkungan #bersihinsampahdepanrumahmu!",
                    username: "Indira",
                    participants: 1,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFF5633A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_outlined),
            label: "Tambah",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Cari",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCard({
    required String image,
    required String title,
    required String subtitle,
    required String username,
    required int participants,
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 218, 208),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  username,
                  style: const TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 5),
                    Text(participants.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentCard({
    required String image,
    required String title,
    required String hashtag,
    required String username,
    required int participants,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  hashtag,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16),
                        const SizedBox(width: 5),
                        Text(participants.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardPage(),
  ));
}