// lib/pages/kalkulator_page.dart
import 'package:flutter/material.dart';
import 'dart:math'; // Import 'math' untuk fungsi 'sqrt' (akar)

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  // ( --- SEMUA LOGIKA STATE ANDA TETAP SAMA, TIDAK SAYA UBAH --- )
  String _display = "0";
  String _currentInput = "";
  String _operator = "";
  double _num1 = 0;
  bool _operatorPressed = false;

  void _onButtonPressed(String text) {
    // ( --- FUNGSI LOGIKA UTAMA ANDA TIDAK SAYA UBAH SAMA SEKALI --- )
    // ( ... Logika Anda dari baris 20 s/d 124 ... )
    setState(() {
      if ("0123456789.".contains(text)) {
        if (_operatorPressed) {
          _display = text;
          _operatorPressed = false;
        } else {
          if (_display == "0") {
            _display = text;
          } else {
            _display += text;
          }
        }
        _currentInput = _display;
      } else if (text == "C") {
        _display = "0";
        _currentInput = "";
        _operator = "";
        _num1 = 0;
        _operatorPressed = false;
      } else if ("+-*/".contains(text)) {
        _num1 = double.parse(_display);
        _operator = text;
        _operatorPressed = true;
      } else if (text == "√") {
        double value = double.parse(_display);
        double result = sqrt(value);
        if (result % 1 == 0) {
          _display = result.toInt().toString();
        } else {
          _display = result.toStringAsFixed(2);
        }
        _currentInput = _display;
      } else if (text == "x²") {
        double value = double.parse(_display);
        double result = (value * value);
        if (result % 1 == 0) {
          _display = result.toInt().toString();
        } else {
          _display = result.toStringAsFixed(2);
        }
        _currentInput = _display;
      } else if (text == "=") {
        if (_operator.isNotEmpty) {
          double num2 = double.parse(_currentInput);
          double result = 0;

          if (_operator == "+") result = _num1 + num2;
          if (_operator == "-") result = _num1 - num2;
          if (_operator == "*") result = _num1 * num2;
          if (_operator == "/") result = _num1 / num2;

          if (result % 1 == 0) {
            _display = result.toInt().toString();
          } else {
            _display = result.toStringAsFixed(2);
          }
          _operator = "";
          _operatorPressed = false;
        }
      }
    });
  }
  // ( --- AKHIR DARI BLOK LOGIKA ANDA --- )

  // --- WIDGET HELPER UNTUK TOMBOL (DESAIN DIPERBARUI) ---
  // Saya hapus 'Expanded' dari sini agar kita bisa fleksibel di layout '0'
  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    final theme = Theme.of(context);

    // Tentukan warna default jika tidak di-override
    final bgColor = color ?? theme.colorScheme.surfaceContainerHighest;
    final fgColor = textColor ?? theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FilledButton(
        // <-- Mengganti ElevatedButton dengan FilledButton
        style: FilledButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // <-- Sedikit lebih bulat
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ), // <-- Padding vertikal
        ),
        onPressed: () => _onButtonPressed(text),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ambil tema sekali saja untuk efisiensi
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Sederhana"),
        // --- DESAIN DIPERBARUI ---
        elevation: 0, // Menghilangkan bayangan
        backgroundColor: theme.colorScheme.surface, // Menyamakan dengan display
      ),
      body: Column(
        children: [
          // --- LAYAR DISPLAY (DESAIN DIPERBARUI) ---
          Expanded(
            flex: 2, // Ambil 2 bagian layar
            child: Container(
              color: theme.colorScheme.surface, // Warna dari tema
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                _display,
                style: TextStyle(
                  // --- Tipografi lebih modern dan elegan ---
                  fontSize: 56, // Lebih besar
                  fontWeight: FontWeight.w300, // Lebih tipis
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 1,
              ),
            ),
          ),

          // --- KEYPAD (DESAIN DIPERBARUI) ---
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
                        // --- Menggunakan warna TEMA, bukan hardcode Colors.orange ---
                        Expanded(
                          child: _buildButton(
                            "C",
                            color: theme.colorScheme.tertiaryContainer,
                            textColor: theme.colorScheme.onTertiaryContainer,
                          ),
                        ),
                        Expanded(child: _buildButton("x²")),
                        Expanded(child: _buildButton("√")),
                        // --- Menggunakan warna TEMA, bukan hardcode Colors.blue ---
                        Expanded(
                          child: _buildButton(
                            "/",
                            color: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _buildButton("7")),
                        Expanded(child: _buildButton("8")),
                        Expanded(child: _buildButton("9")),
                        Expanded(
                          child: _buildButton(
                            "*",
                            color: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _buildButton("4")),
                        Expanded(child: _buildButton("5")),
                        Expanded(child: _buildButton("6")),
                        Expanded(
                          child: _buildButton(
                            "-",
                            color: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _buildButton("1")),
                        Expanded(child: _buildButton("2")),
                        Expanded(child: _buildButton("3")),
                        Expanded(
                          child: _buildButton(
                            "+",
                            color: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // --- Tombol 0 kini 2x lebih lebar (flex: 2) ---
                        Expanded(
                          flex: 2,
                          child: _buildButton(
                            "0",
                            // --- Menggunakan warna TEMA, bukan hardcode Colors.grey ---
                            color: theme.colorScheme.surfaceContainer,
                          ),
                        ),
                        Expanded(child: _buildButton(".")),
                        Expanded(
                          child: _buildButton(
                            "=",
                            color: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
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
