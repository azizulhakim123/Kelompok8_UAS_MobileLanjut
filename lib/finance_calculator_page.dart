import 'package:flutter/material.dart';

class HalamanKalkulatorKeuangan extends StatefulWidget {
  @override
  _HalamanKalkulatorKeuanganState createState() =>
      _HalamanKalkulatorKeuanganState();
}

class _HalamanKalkulatorKeuanganState extends State<HalamanKalkulatorKeuangan> {
  double pokok = 0.0;
  double bunga = 0.0;
  int waktu = 0;
  String hasil = '';

  void hitungBunga() {
    setState(() {
      double bungaBersih = (pokok * bunga * waktu) / 100;
      hasil = 'Bunga: Rp${bungaBersih.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Keuangan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah Pokok'),
              onChanged: (value) {
                pokok = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tingkat Bunga (%)'),
              onChanged: (value) {
                bunga = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Waktu (tahun)'),
              onChanged: (value) {
                waktu = int.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: hitungBunga,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              hasil,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks halaman ini
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Keuangan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Konversi',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            // Sudah di halaman ini
          } else if (index == 2) {
            Navigator.pushNamed(context, '/conversion');
          }
        },
      ),
    );
  }
}
