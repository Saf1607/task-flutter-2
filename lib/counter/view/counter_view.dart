import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/counter/counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 228, 240),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            // Menampilkan Snackbar jika counter adalah kelipatan 5
            if (state % 5 == 0 && state != 0) {
              // Menampilkan Snackbar setiap kelipatan 5
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You got $state!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              });
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Menampilkan surprise gambar ketika counter kelipatan 5
                if (state % 5 == 0 && state != 0)
                  Column(
                    children: [
                      Image.asset('assets/surprise_image.png',
                          height: 200), // Gambar surprise
                      Text(
                        'Surprise! You got $state!',
                        style: textTheme.headlineMedium?.copyWith(
                            color: const Color.fromARGB(255, 12, 4, 74)),
                      ),
                    ],
                  ),
                // Menampilkan counter
                Text(
                  '$state',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(height: 40), // Space between counter and buttons
                // Menampilkan tombol-tombol
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Tombol Increment
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 48, 80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () =>
                            context.read<CounterCubit>().increment(),
                        child: const Icon(Icons.add,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 20), // Space between buttons
                      // Tombol Decrement
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 48, 80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () =>
                            context.read<CounterCubit>().decrement(),
                        child: const Icon(Icons.remove,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 20), // Space between buttons
                      // Tombol Multiply x2
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 48, 80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () =>
                            context.read<CounterCubit>().multiplyBy2(),
                        child: const Icon(Icons.close,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 20), // Space between buttons
                      // Tombol Subtract 2
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 48, 80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () =>
                            context.read<CounterCubit>().subtract2(),
                        child: const Icon(Icons.exposure_neg_2,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 20), // Space between buttons
                      // Tombol Reset
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 48, 80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () => context.read<CounterCubit>().reset(),
                        child: const Icon(Icons.refresh,
                            size: 40,
                            color: Colors.white), // Ikon berwarna putih
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
