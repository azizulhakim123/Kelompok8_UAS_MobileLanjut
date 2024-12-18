import 'package:flutter/material.dart';

class HalamanKonversi extends StatefulWidget {
  @override
  _HalamanKonversiState createState() => _HalamanKonversiState();
}

class _HalamanKonversiState extends State<HalamanKonversi> {
  String kategoriKonversi = 'Panjang';
  double nilaiInput = 0.0;
  String hasil = '';

  void konversi() {
    setState(() {
      if (kategoriKonversi == 'Panjang') {
        hasil = '${nilaiInput * 100} cm'; // Contoh: meter ke cm
      } else if (kategoriKonversi == 'Berat') {
        hasil = '${nilaiInput * 1000} g'; // Contoh: kg ke gram
      } else if (kategoriKonversi == 'Suhu') {
        hasil = '${(nilaiInput * 9 / 5) + 32} °F'; // Celcius ke Fahrenheit
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Satuan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: kategoriKonversi,
              items: ['Panjang', 'Berat', 'Suhu']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  kategoriKonversi = value!;
                  hasil = ''; // Reset hasil saat kategori diubah
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai Input'),
              onChanged: (value) {
                nilaiInput = double.tryParse(value) ?? 0.0;
              },
            ),
            ElevatedButton(
              onPressed: konversi,
              child: Text('Konversi'),
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
        currentIndex: 2, // Indeks halaman ini
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
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
            Navigator.pushNamed(context, '/history');
          } else if (index == 2) {
            // Sudah di halaman ini
          }
        },
      ),
    );
  }
}
