import 'package:flutter/foundation.dart';

@immutable
class CatFact {
  final String fact;
  final int length;

  const CatFact({
    required this.fact,
    required this.length,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['fact'] as String,
      length: json['length'] as int,
    );
  }

  @override
  String toString() {
    return 'CatFact(fact: $fact, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CatFact && other.fact == fact && other.length == length;
  }

  @override
  int get hashCode => fact.hashCode ^ length.hashCode;
}