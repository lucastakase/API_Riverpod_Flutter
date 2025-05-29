import 'package:api_riverpod/pages/widget_sandbox_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_riverpod/providers/cat_fact_provider.dart';
import 'package:api_riverpod/pages/facts_list_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catFactAsyncValue = ref.watch(catFactProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Facts')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: catFactAsyncValue.when(
                            loading:
                                () => const Column(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 16),
                                    Text(
                                      'Loading Cat Facts...',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                            error:
                                (err, stack) => Text(
                                  'Error: $err',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 16,
                                  ),
                                ),
                            data:
                                (catFact) => Column(
                                  children: [
                                    Text(
                                      catFact.fact,
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Size: ${catFact.length} characters',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(catFactProvider);
                  },
                  child: const Text('New Fact'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FactsListPage(),
                      ),
                    );
                  },
                  child: const Text('Show List'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetSandboxPage(),
                      ),
                    );
                  },
                  child: const Text('Widget Sandbox'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
