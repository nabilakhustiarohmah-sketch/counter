import 'package:flutter/material.dart';
import 'Counter buttons.dart';
import 'Counter display.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _subtract() {
    // Angka tidak boleh minus
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [scheme.primary, scheme.primaryContainer],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                // Kartu angka counter
                Card(
                  elevation: 0,
                  color: Colors.white.withAlpha(240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    // Passing data: parent -> child lewat constructor
                    child: CounterDisplay(value: _counter),
                  ),
                ),
                const SizedBox(height: 24),
                // Callback: child memanggil fungsi milik parent
                Card(
                  elevation: 0,
                  color: Colors.white.withAlpha(240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 8,
                    ),
                    child: CounterButtons(
                      onAdd: _add,
                      onSubtract: _subtract,
                      onReset: _reset,
                    ),
                  ),
                ),
                const Spacer(),
                // Tombol kembali ke beranda
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 1.5),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.home_rounded),
                    label: const Text(
                      'Kembali ke Beranda',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
