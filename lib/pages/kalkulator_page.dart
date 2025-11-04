// lib/pages/kalkulator_page.dart
import 'package:flutter/material.dart';
import 'dart:math'; // Import 'math' untuk fungsi 'sqrt' (akar)

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  // Variabel state untuk logika kalkulator
  String _display = "0"; // Teks yang tampil di layar
  String _currentInput = ""; // Angka yang sedang diketik
  String _operator = ""; // Operator (+, -, *, /)
  double _num1 = 0; // Angka pertama
  bool _operatorPressed = false; // <-- 1. VARIABEL STATE BARU DITAMBAHKAN

  // Fungsi yang dipanggil saat tombol ditekan
  void _onButtonPressed(String text) {
    setState(() {
      if ("0123456789.".contains(text)) {
        // --- INPUT ANGKA (LOGIKA DIPERBARUI) ---

        // Cek apakah operator baru saja ditekan
        if (_operatorPressed) {
          _display = text; // Ganti display dengan angka baru
          _operatorPressed = false; // Matikan status
        } else {
          // Logika lama (jika sedang mengetik angka)
          if (_display == "0") {
            _display = text; // Ganti "0" dengan angka pertama
          } else {
            _display += text; // Tambahkan angka ke display
          }
        }
        _currentInput = _display; // Simpan ke input saat ini
      } else if (text == "C") {
        // --- TOMBOL HAPUS (CLEAR) [Poin e] ---
        _display = "0";
        _currentInput = "";
        _operator = "";
        _num1 = 0;
        _operatorPressed = false; // <-- 2. RESET STATE SAAT CLEAR
      } else if ("+-*/".contains(text)) {
        // --- OPERATOR (LOGIKA DIPERBARUI) ---
        _num1 = double.parse(_display);
        _operator = text;
        _operatorPressed = true; // <-- 3. SET STATE (BUKAN RESET DISPLAY)
      } else if (text == "√") {
        // --- AKAR KUADRAT [Poin e] ---
        double value = double.parse(_display);
        double result = sqrt(value); // Hitung hasilnya dulu
        // Tambahkan pengecekan
        if (result % 1 == 0) {
          // Cek jika ini bilangan bulat
          _display = result.toInt().toString(); // Tampilkan sbg integer ("9")
        } else {
          _display = result.toStringAsFixed(
            2,
          ); // Tampilkan sbg desimal ("1.73")
        }
        _currentInput = _display; // <-- 4. UPDATE CURRENT INPUT
      } else if (text == "x²") {
        // --- KUADRAT [Poin e] ---
        double value = double.parse(_display);
        double result = (value * value); // Hitung hasilnya dulu
        // Tambahkan pengecekan
        if (result % 1 == 0) {
          // Cek jika ini bilangan bulat
          _display = result.toInt().toString(); // Tampilkan sbg integer ("25")
        } else {
          _display = result.toStringAsFixed(2); // Tampilkan sbg desimal
        }
        _currentInput = _display; // <-- 5. UPDATE CURRENT INPUT
      } else if (text == "=") {
        // --- TOMBOL SAMA DENGAN (=) ---
        if (_operator.isNotEmpty) {
          double num2 = double.parse(_currentInput);
          double result = 0;

          if (_operator == "+") result = _num1 + num2;
          if (_operator == "-") result = _num1 - num2;
          if (_operator == "*") result = _num1 * num2;
          if (_operator == "/") result = _num1 / num2;

          // --- INI BAGIAN YANG DIPERBAIKI ---
          // Mengganti _display = result.toStringAsFixed(2);
          if (result % 1 == 0) {
            // Cek jika ini bilangan bulat
            _display = result
                .toInt()
                .toString(); // Tampilkan sbg integer ("15")
          } else {
            _display = result.toStringAsFixed(
              2,
            ); // Tampilkan sbg desimal ("7.50")
          }
          // --- AKHIR PERBAIKAN ---

          _operator = ""; // Selesaikan operasi
          _operatorPressed = false; // <-- 6. RESET STATE SAAT SELESAI
        }
      }
    });
  }

  // Widget helper untuk membuat satu tombol
  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                color ?? Theme.of(context).colorScheme.surfaceContainerHighest,
            foregroundColor:
                textColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Sederhana")),
      body: Column(
        children: [
          // --- LAYAR DISPLAY ---
          Expanded(
            flex: 2, // Ambil 2 bagian layar
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
          ),

          // --- KEYPAD ---
          Expanded(
            flex: 3, // Ambil 3 bagian layar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildButton(
                          "C",
                          color: Colors.orange,
                          textColor: Colors.white,
                        ),
                        _buildButton("x²"),
                        _buildButton("√"),
                        _buildButton(
                          "/",
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildButton("7"),
                        _buildButton("8"),
                        _buildButton("9"),
                        _buildButton(
                          "*",
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildButton("4"),
                        _buildButton("5"),
                        _buildButton("6"),
                        _buildButton(
                          "-",
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildButton("1"),
                        _buildButton("2"),
                        _buildButton("3"),
                        _buildButton(
                          "+",
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildButton("0", color: Colors.grey[300]),
                        _buildButton("."),
                        _buildButton(
                          "=",
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
