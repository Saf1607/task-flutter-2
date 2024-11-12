import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Container(
      color: const Color.fromARGB(255, 213, 228, 240),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Hi, Safira You Have ${appState.favorites.length} Favorite Words',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 8, 15, 56),
                ),
          ),
          const SizedBox(height: 16),
          ...appState.favorites.map(
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
                  Icons.favorite,
                  color: const Color.fromARGB(255, 237, 5, 83),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever_rounded, color: Colors.red),
                  onPressed: () {
                    appState.favorites.remove(word); // Hapus item favorit
                    appState
                        .notifyListeners(); // Perbarui tampilan setelah menghapus
                  },
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("It's ${word.asLowerCase}!"),
                    ),
                  );
                },
                onLongPress: () {
                  appState.favorites.remove(word);
                  appState
                      .notifyListeners(); // Perbarui tampilan setelah menghapus
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("${word.asLowerCase} removed from favorites."),
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
