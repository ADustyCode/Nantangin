
import 'package:flutter/material.dart';
import 'register.dart';
import 'signin.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.width * 0.75, 0, 0),
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 225,
                width: 225,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30), // Jarak dari tepi bawah
            child: Column(
              children: [
                GestureDetector(
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width * 0.9, // Lebar tombol
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5633A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 18), // Tinggi tombol
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAcc()));
                      },
                      child: const Text(
                        "Buat akun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Jarak antara tombol
                GestureDetector(
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width * 0.9, // Lebar tombol
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200, // Warna tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 18), // Tinggi tombol
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginAcc()));
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
