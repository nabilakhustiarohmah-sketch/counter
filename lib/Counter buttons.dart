import 'package:flutter/material.dart';

class CounterButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onReset;

  const CounterButtons({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.onReset,
  });

  // Isi tombol (ikon + teks) otomatis mengecil agar tidak overflow
  Widget _content(IconData icon, String label) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 6, vertical: 12);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: padding),
            onPressed: onSubtract,
            child: _content(Icons.remove, 'Kurang'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(padding: padding),
            onPressed: onReset,
            child: _content(Icons.refresh, 'Reset'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: padding),
            onPressed: onAdd,
            child: _content(Icons.add, 'Tambah'),
          ),
        ),
      ],
    );
  }
}
