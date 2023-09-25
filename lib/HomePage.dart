import 'package:flutter/material.dart';
import '/TambahPemasukan.dart';
import '/TambahPengeluaran.dart';
import '/DetailCash.dart';
import '/Setting.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Rangkuman Bulan Ini',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Text(
                'Pengeluaran: Rp.1.000.000',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Pemasukan: Rp 2.000.000',
                style: TextStyle(fontSize: 18.0),
              ),
              Container(
                alignment: Alignment.center,
                height: 265.0,
                child: Image.asset(
                  'assets/grafik1.png',
                  width: 270,
                  height: 240,
                ),
              ),
              Expanded(
                // width: 250.0, // Lebar Column
                // height: 165.0, // Tinggi Column
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ImageButton(
                            imageAsset: 'assets/pemasukan.png',
                            label: 'Tambah Pemasukan',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TambahPemasukan()),
                              );
                            },
                          ),
                      ImageButton(
                            imageAsset: 'assets/cashFlow.png',
                            label: 'Detail Cash Flow',
                            onTap: () {
                              //    Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DetailCash()),
                              // );
                            },
                          ),

                        ],
                      ),
                    ),

// Kolom 2
                    Expanded(
                      child: Column(
                        children: <Widget>[
                               ImageButton(
                            imageAsset: 'assets/pengeluaran.png',
                            label: 'Tambah Pengeluaran',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TambahPengeluaran()),
                              );
                            },
                          ),
                         
                          ImageButton(
                            imageAsset: 'assets/setting.png',
                            label: 'Pengaturan',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Setting()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String imageAsset;
  final String label;
  final VoidCallback onTap;

  ImageButton({
    required this.imageAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            width: 100.0, // Sesuaikan lebar gambar sesuai kebutuhan Anda
            height: 100.0, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
