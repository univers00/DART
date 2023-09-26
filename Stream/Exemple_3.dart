Stream<int> getNumbers() async* {
  for (int index = 0; index < 20; index++) {
    await Future.delayed(const Duration(seconds: 1));
    if (index == 10) throw Exception("i throw an excepton just for testing");
    yield index;
  }
}

void main() async {
  await for (int number in getNumbers()) {
    print(number);
  }
}
