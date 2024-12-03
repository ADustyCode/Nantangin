import 'package:flutter/material.dart';
import 'package:nantangin/component/btm_navbar.dart';
import 'package:nantangin/ui/create_chall.dart';

class ChallengeDetailPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String username;
  final int participants;

  const ChallengeDetailPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.username,
    required this.participants,
  }) : super(key: key);

  @override
  _ChallengeDetailPageState createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Memasukkan halaman ke dalam `_pages`
    _pages.add(DetailsPageContent(
      image: widget.image,
      title: widget.title,
      subtitle: widget.subtitle,
      username: widget.username,
      participants: widget.participants,
    ));
    _pages.addAll([
      const Placeholder(), // Halaman untuk "Tambah"
      const CreateChallengePage(), // Halaman untuk "Notifikasi"
      const Placeholder(), // Halaman untuk "Cari"
      const Placeholder(), // Halaman untuk "Profil"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            // Kembali ke dashboard jika tombol "Beranda" ditekan
            Navigator.pop(context);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}

class DetailsPageContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String username;
  final int participants;

  const DetailsPageContent({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.username,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          "images/logo.png",
          height: 225,
          width: 225,
          fit: BoxFit.fitWidth,
        ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Profil dan Button "Ikut tantangan"
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(image),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "5 hour ago",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    print("Ikut tantangan");
                  },
                  child: const Text(
                    "Ikut tantangan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Challenge Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Title and description
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Footer: Participants
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      "$participants",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "1900", // Example like count
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChallengeDetailPage(
        image: "https://via.placeholder.com/150",
        title: "Push Up 100 kali dalam sehari",
        subtitle:
            "Yo, mau body goals tanpa ribet? Push up aja! Gak perlu gym mahal-mahal, cuma modal lantai dan motivasi.",
        username: "Nanskyu",
        participants: 1900,
      ),
    ),
  );
}
