import 'package:flutter/material.dart';
import 'package:NantangIn/component/btm_navbar.dart';
import 'package:NantangIn/ui/create_chall.dart';
import 'package:NantangIn/ui/details.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

   @override
  _DashboardPageState createState() => _DashboardPageState();
}
  class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPageContent(),
    const Placeholder(), // Halaman untuk "Tambah"
    const CreateChallengePage(), // Halaman untuk "Buat"
    const Placeholder(), // Halaman untuk "Cari"
    const Placeholder(), // Halaman untuk "Profil"
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardPageContent extends StatelessWidget {
  const DashboardPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset("assets/images/logo.png",
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
                    child: const Text("lihat semua",
                        style: TextStyle(color: Color(0xFFF5633A))),
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
                      context: context,
                      image: "assets/images/pushup.jpg",
                      title: "Push Up 100 kali dalam sehari",
                      subtitle:
                          "Lu belum keren kalo belum push up 100 kali sehari!",
                      username: "Nanskuy",
                      participants: 13,
                    ),
                    const SizedBox(width: 10),
                    _buildPopularCard(
                      context: context,
                      image: "assets/images/pushup.jpg",
                      title: "Chin Up 100 kali dalam sehari",
                      subtitle:
                          "Lu belum keren kalo belum chin up 100 kali sehari!",
                      username: "Nanskuy",
                      participants: 8,
                    ),
                    const SizedBox(width: 10),
                    _buildPopularCard(
                      context: context,
                      image: "assets/images/pushup.jpg",
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
                    child: const Text("lihat semua",
                        style: TextStyle(color: Color(0xFFF5633A))),
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
    );
  }

  Widget _buildPopularCard({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
    required String username,
    required int participants,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChallengeDetailPage(
                image: "assets/images/pushup.jpg",
                title: "Push Up 100 kali dalam sehari",
                subtitle: "Lu belum keren kalo belum push up 100 kali sehari!",
                username: "Nanskuy",
                participants: 13),
          ),
        );
      },
      child: Container(
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
                child: Image.asset(
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
