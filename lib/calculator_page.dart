import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class HalamanKalkulator extends StatefulWidget {
  @override
  _HalamanKalkulatorState createState() => _HalamanKalkulatorState();
}

class _HalamanKalkulatorState extends State<HalamanKalkulator> {
  String input = ''; // Untuk menampilkan input pengguna
  String result = ''; // Untuk menampilkan hasil perhitungan

  void onButtonPressed(String value) {
    setState(() {
      input += value; // Menambahkan input yang dimasukkan ke string input
    });
  }

  void onCalculate() {
    try {
      final expression = Expression.parse(input); // Parsing ekspresi string
      final evaluator = ExpressionEvaluator();
      final resultValue = evaluator.eval(expression, {});

      setState(() {
        result = resultValue.toString(); // Menampilkan hasil perhitungan
      });
    } catch (e) {
      setState(() {
        result = 'Error'; // Menampilkan pesan error jika ekspresi tidak valid
      });
    }
  }

  void onClear() {
    setState(() {
      input = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        input,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      String buttonText = _getButtonText(index);
                      return ElevatedButton(
                        onPressed: () {
                          if (buttonText == '=') {
                            onCalculate();
                          } else if (buttonText == 'C') {
                            onClear();
                          } else {
                            onButtonPressed(buttonText);
                          }
                        },
                        child: Text(buttonText, style: TextStyle(fontSize: 24)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/mathFunction'); // Langsung navigasi ke halaman fungsi matematika
              },
              child: Icon(Icons.functions),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Indeks halaman ini
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
            // Sudah di halaman ini
          } else if (index == 1) {
            Navigator.pushNamed(context, '/finance');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/conversion');
          }
        },
      ),
    );
  }

  String _getButtonText(int index) {
    List<String> buttons = [
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      '*',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',
      'C'
    ];
    return buttons[index];
  }
}
