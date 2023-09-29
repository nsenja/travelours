import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Database_Helper.dart';

class Setting extends StatefulWidget {
  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Setting> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordBaruController = TextEditingController();
  // String _nama = 'Nabila Senja'; // Ganti dengan nama Anda
  // String _nim = '1941720134'; // Ganti dengan NIM Anda
  String _passwordSaatIni = 'password'; // Ganti dengan password saat ini

  bool _isPasswordSaatIniBenar =
      true; // Untuk memeriksa apakah password saat ini benar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Ganti Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password Saat Ini'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _passwordBaruController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password Baru'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna latar belakang hijau
              ),
              child: Text('Simpan'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('<<< Kembali'),
            ),
            SizedBox(
              height: 120.0,
            ),
            Image.asset(
              'assets/logo.png',
              width: 250.0, // Sesuaikan lebar sesuai kebutuhan Anda
              height: 200.0, // Sesuaikan tinggi sesuai kebutuhan Anda
            ),
            Text(
              'Nabila Senja',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('1941720134'),
          ],
        ),
      ),
    );
  }
}
