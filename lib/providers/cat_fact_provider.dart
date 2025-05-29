import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_riverpod/models/cat_fact.dart';
import 'package:api_riverpod/services/cat_fact_service.dart';

final catFactServiceProvider = Provider((ref) => CatFactService());

final catFactProvider = FutureProvider<CatFact>((ref) async {
  final catFactService = ref.watch(catFactServiceProvider);
  return catFactService.fetchCatFact();
});

final allCatFactsProvider = FutureProvider<List<CatFact>>((ref) async {
  final catFactService = ref.watch(catFactServiceProvider);
  return catFactService.fetchCatFacts();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredCatFactsProvider = FutureProvider<List<CatFact>>((ref) async {
  final allFactsAsyncValue = ref.watch(allCatFactsProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  return allFactsAsyncValue.when(
    loading: () => [],
    error: (err, stack) => [],
    data: (facts) {
      if (searchQuery.isEmpty) {
        return facts;
      } else {
        return facts
            .where((fact) =>
                fact.fact.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
      }
    },
  );
});