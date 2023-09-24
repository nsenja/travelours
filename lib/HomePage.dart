import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Pengeluaran:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Rp 1.000.000',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Pemasukan:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Rp 2.000.000',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              'Grafik Pemasukan/Pengeluaran per Hari:',
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              height: 200.0, // Ubah sesuai kebutuhan
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavButton(icon: Icons.add, label: 'Tambah Pemasukan'),
                NavButton(icon: Icons.remove, label: 'Tambah Pengeluaran'),
                NavButton(icon: Icons.description, label: 'Detail Cash Flow'),
                NavButton(icon: Icons.settings, label: 'Pengaturan'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class NavButton extends StatelessWidget {
  final IconData icon;
  final String label;

  NavButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // Navigasi ke halaman yang sesuai
          },
        ),
        Text(label),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
