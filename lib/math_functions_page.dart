import 'package:flutter/material.dart';
import 'dart:math' as math;

class MathFunctionsPage extends StatefulWidget {
  @override
  _MathFunctionsPageState createState() => _MathFunctionsPageState();
}

class _MathFunctionsPageState extends State<MathFunctionsPage> {
  TextEditingController _controller = TextEditingController();
  String result = '';

  void onCalculate(String function) {
    try {
      double input = double.parse(_controller.text);
      double calcResult;

      switch (function) {
        case 'sin':
          calcResult = math.sin(input * math.pi / 180);
          break;
        case 'cos':
          calcResult = math.cos(input * math.pi / 180);
          break;
        case 'tan':
          calcResult = math.tan(input * math.pi / 180);
          break;
        case 'sqrt':
          calcResult = math.sqrt(input);
          break;
        case 'log':
          calcResult = math.log(input);
          break;
        case 'exp':
          calcResult = math.exp(input);
          break;
        default:
          calcResult = 0.0;
      }

      setState(() {
        result = calcResult.toString();
      });
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Fungsi Matematika'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Angka',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => onCalculate('sin'),
                  child: Text('sin'),
                ),
                ElevatedButton(
                  onPressed: () => onCalculate('cos'),
                  child: Text('cos'),
                ),
                ElevatedButton(
                  onPressed: () => onCalculate('tan'),
                  child: Text('tan'),
                ),
                ElevatedButton(
                  onPressed: () => onCalculate('sqrt'),
                  child: Text('√'),
                ),
                ElevatedButton(
                  onPressed: () => onCalculate('log'),
                  child: Text('log'),
                ),
                ElevatedButton(
                  onPressed: () => onCalculate('exp'),
                  child: Text('e^x'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
