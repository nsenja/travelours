// tambah_pemasukan.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Database_Helper.dart';

class TambahPemasukan extends StatefulWidget {
  @override
  _TambahPemasukanState createState() => _TambahPemasukanState();
}

class _TambahPemasukanState extends State<TambahPemasukan> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  void _resetForm() {
    _tanggalController.text =
        DateFormat('dd/MM/yyyy').format(DateTime(2021, 1, 1));
    _jumlahController.clear();
    _keteranganController.clear();
  }

  void _simpanPemasukan() async {
    final databaseHelper = DatabaseHelper();
    final pemasukan = {
      'tanggal': _tanggalController.text,
      'jumlah': double.tryParse(_jumlahController.text) ?? 0.0,
      'keterangan': _keteranganController.text,
    };

    final id = await databaseHelper.insertPemasukan(pemasukan);
    print('Pemasukan disimpan dengan ID: $id');
    Navigator.pop(context); // Kembali ke halaman Beranda
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _tanggalController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pemasukan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Tambah Pemasukan',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal'),
              onTap: () => _selectDate(),
            ),
            TextFormField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nominal'),
            ),
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
            SizedBox(height: 16.0),
            Padding(padding: EdgeInsets.all(12.0),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _resetForm,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Warna latar belakang oranye
                  ),
                  child: Text('Reset'),
                ),
                  SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed:() {
                     Navigator.pop(context);
                  },                
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Warna latar belakang hijau
                  ),
                  child: Text('Simpan'),
                ),
                  SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: (){
                     Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,                   
                  ),
                  child: Text('<<< Kembali'),
                ),
              ],
            )
            )
          ],
        ),
      ),
    );
  }
}
