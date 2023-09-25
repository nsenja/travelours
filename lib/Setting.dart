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
  String _nama = 'Nama Anda'; // Ganti dengan nama Anda
  String _nim = 'NIM Anda'; // Ganti dengan NIM Anda
  String _passwordSaatIni = 'password'; // Ganti dengan password saat ini

  bool _isPasswordSaatIniBenar = true; // Untuk memeriksa apakah password saat ini benar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/your_photo.jpg'), // Ganti dengan path foto Anda
              radius: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(_nama),
            Text(_nim),
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
                // Periksa apakah password saat ini benar
                if (_passwordController.text == _passwordSaatIni) {
                  setState(() {
                    _isPasswordSaatIniBenar = true;
                  });

                  // Simpan password baru
                  _passwordSaatIni = _passwordBaruController.text;
                  _passwordBaruController.clear();
                } else {
                  setState(() {
                    _isPasswordSaatIniBenar = false;
                  });
                }
              },
              child: Text('Simpan Password Baru'),
            ),
            if (!_isPasswordSaatIniBenar)
              Text(
                'Password saat ini tidak benar.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
