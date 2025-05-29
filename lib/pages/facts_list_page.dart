import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_riverpod/providers/cat_fact_provider.dart';

class FactsListPage extends ConsumerWidget {
  const FactsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredFactsAsyncValue = ref.watch(filteredCatFactsProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                ref.read(searchQueryProvider.notifier).state = query;
              },
              decoration: InputDecoration(
                hintText: 'Search Facts...',
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[700],
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.tealAccent,
              controller: TextEditingController(text: searchQuery),
            ),
          ),
        ),
      ),
      body: filteredFactsAsyncValue.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        // Estado de erro
        error: (err, stack) => Center(
          child: Text('Erro: $err', style: TextStyle(color: Colors.redAccent, fontSize: 18)),
        ),
        // Estado de dados (sucesso)
        data: (facts) {
          if (facts.isEmpty && searchQuery.isNotEmpty) {
            return const Center(
              child: Text('No result.', style: TextStyle(fontSize: 18, color: Colors.white70)),
            );
          } else if (facts.isEmpty) {
            return const Center(
              child: Text('No result.', style: TextStyle(fontSize: 18, color: Colors.white70)),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: facts.length,
            itemBuilder: (context, index) {
              final fact = facts[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fact.fact,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Size: ${fact.length} caracters',
                        style: const TextStyle(fontSize: 14, color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}