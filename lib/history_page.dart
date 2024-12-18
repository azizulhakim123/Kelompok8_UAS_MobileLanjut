import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history = [
    '1 + 2 = 3',
    '10 * 5 = 50',
    '7 - 3 = 4',
    '20 / 4 = 5',
  ]; // Contoh data history

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.history, color: Colors.blue),
              title: Text(
                history[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
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
            // Sudah di halaman ini
          } else if (index == 2) {
            Navigator.pushNamed(context, '/conversion');
          }
        },
      ),
    );
  }
}
