import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _display = "0";
  String _currentInput = "";
  String _operator = "";
  double _num1 = 0;
  bool _operatorPressed = false;

  void _onButtonPressed(String text) {
    setState(() {
      if ("0123456789.".contains(text)) {
        if (_operatorPressed) {
          _display = text;
          _operatorPressed = false;
        } else {
          if (_display == "0" && text != ".") {
            _display = text;
          } else if (_display.contains('.') && text == '.') {
            return;
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
        if (_operator.isNotEmpty && !_operatorPressed) {
          _onButtonPressed("=");
          _operatorPressed = true;
        }
        _num1 = double.parse(_display);
        _operator = text;
        _operatorPressed = true;
      } else if (text == "√") {
        double value = double.parse(_display);
        double result = sqrt(value);
        if (result % 1 == 0) {
          _display = result.toInt().toString();
        } else {
          _display = result.toStringAsFixed(5);
        }
        _currentInput = _display;
      } else if (text == "x²") {
        double value = double.parse(_display);
        double result = (value * value);
        if (result % 1 == 0) {
          _display = result.toInt().toString();
        } else {
          _display = result.toStringAsFixed(5);
        }
        _currentInput = _display;
      } else if (text == "=") {
        if (_operator.isNotEmpty && _currentInput.isNotEmpty) {
          double num2 = double.parse(_currentInput);
          double result = 0;

          if (_operator == "+") result = _num1 + num2;
          if (_operator == "-") result = _num1 - num2;
          if (_operator == "*") result = _num1 * num2;
          if (_operator == "/") {
            if (num2 == 0) {
              _display = "Error";
              return;
            }
            result = _num1 / num2;
          }

          if (result % 1 == 0) {
            _display = result.toInt().toString();
          } else {
            _display = result.toStringAsFixed(5);
          }
          _operator = "";
          _operatorPressed = false;
          _currentInput = _display;
          _num1 = result;
        }
      }
    });
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    final theme = Theme.of(context);
    final bgColor = color ?? theme.colorScheme.surfaceContainerHighest;
    final fgColor = textColor ?? theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24),
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
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(title: Text("Kalkulator")),

          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: theme.scaffoldBackgroundColor,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Text(
                      _display,
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w300,
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: _buildButton(
                                  "C",
                                  color: theme.colorScheme.tertiaryContainer,
                                  textColor:
                                      theme.colorScheme.onTertiaryContainer,
                                ),
                              ),
                              Expanded(child: _buildButton("x²")),
                              Expanded(child: _buildButton("√")),
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
                              Expanded(
                                flex: 2,
                                child: _buildButton(
                                  "0",
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
          ),
        ],
      ),
    );
  }
}
