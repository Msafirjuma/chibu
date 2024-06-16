import 'dart:math';

double euclideanDistance(List? e1, List? e2) {
  if (e1 == null || e2 == null) throw Exception("Null argument");

  double sum = 0;
  for (int i = 0; i < e1.length; i++) {
    sum += pow((e1[i] - e2[i]), 2);
  }

  return sqrt(sum);
}