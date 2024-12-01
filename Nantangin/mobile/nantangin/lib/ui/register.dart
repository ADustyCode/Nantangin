import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nantangin/ui/dashboard.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<CreateAcc> {
  bool _isPasswordVisible = false; // State untuk visibility password
  int _currentStep = 1; // Kontrol langkah saat ini
  String? _dob; // Menyimpan tanggal lahir yang dipilih
  String? _username; // Menyimpan username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Langkah $_currentStep dari 2",
              style: const TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'MerriweatherSans', fontWeight: FontWeight.bold),
            ),
            Text(
              _currentStep == 1 ? "Akun Anda" : "Lengkapi Profil",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'MerriweatherSans'
              ),
            ),
            const SizedBox(height: 20),

            // Konten berdasarkan langkah
            Expanded(
              child: _currentStep == 1
                  ? _buildStep1()
                  : _buildStep2(), // Pilih langkah berdasarkan state
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 30,
                      ),
                    ),
                    onPressed: () {
                      if (_currentStep <= 1) {
                        Navigator.pop(context); // Kembali ke halaman landing jika langkah 1
                      } else {
                        setState(() {
                          _currentStep--;
                        });
                      }
                    },
                    child: const Text(
                      "Kembali",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriweatherSans'
                      ),
                    ),
                  ),
                  // Tombol navigasi
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5633A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 30,
                      ),
                    ),
                    onPressed: () {
                      if (_currentStep == 1) {
                        setState(() {
                          _currentStep++;
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardPage()));
                      }
                    },
                    child: Text(
                      _currentStep == 1 ? "Berikutnya" : "Selesai",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriweatherSans'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                    "Email",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'MerriweatherSans', fontWeight: FontWeight.bold),
                  ),
            ],
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: "Alamat email",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color(0xFFF5F5F5),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                    "Kata sandi",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'MerriweatherSans', fontWeight: FontWeight.bold),
                  ),
            ],
          ),
        ),
        TextField(
          obscureText: !_isPasswordVisible, // Tampilkan/simpan sandi
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline),
            hintText: "Pilih kata sandi anda",
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible; // Toggle state
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                    "Tanggal lahir",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'MerriweatherSans', fontWeight: FontWeight.bold),
                  ),
            ],
          ),
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_today_outlined),
            hintText: _dob ?? "Tanggal lahir (misal: 1/11/2004)",
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              setState(() {
                _dob = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              });
            }
          },
          readOnly: true, // Mencegah keyboard muncul
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                    "Username",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'MerriweatherSans', fontWeight: FontWeight.bold),
                  ),
            ],
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.alternate_email_rounded),
            hintText: "Masukkan username Anda",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color(0xFFF5F5F5),
          ),
          onChanged: (value) {
            setState(() {
              _username = value;
            });
          },
        ),
      ],
    );
  }

  void _submitForm() {
    // Logika untuk submit form
    print("Tanggal Lahir: $_dob");
    print("Username: $_username");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registrasi Berhasil!')),
    );
  }
}
