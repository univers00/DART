Stream<int> numbers() async* {
  yield 12;
  yield 20;
  yield 10;
  yield 23;
}

void main() async {
  final sum = await numbers().reduce((previous, element) => previous + element);
  print(sum);
}
