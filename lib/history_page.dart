import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app_state.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Container(
      color: const Color.fromARGB(255, 213, 228, 240),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Menambahkan tombol "Delete All" di bagian atas dengan styling
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History Word',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 8, 15, 56),
                    ),
              ),
              TextButton(
                onPressed: () {
                  // Menghapus seluruh history
                  appState.history.clear();
                  appState.notifyListeners();
                },
                child: Text(
                  'Delete All',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 176, 20, 9),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (appState.history.isEmpty)
            Center(
              child: Text(
                'Tidak ada Kata.',
                style: TextStyle(color: const Color.fromARGB(255, 8, 15, 56)),
              ),
            ),
          ...appState.history.map(
            (word) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  word.asLowerCase,
                  style: TextStyle(color: const Color.fromARGB(255, 8, 15, 56)),
                ),
                leading: Icon(
                  Icons.history,
                  color: const Color.fromARGB(255, 12, 10, 6),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Word ${word.asLowerCase}!"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
