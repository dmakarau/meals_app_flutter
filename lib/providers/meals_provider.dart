import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/mock_data.dart';

final mealsProvider = Provider((ref) {
  return mockedMeals;
} );