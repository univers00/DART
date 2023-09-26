void main()async {
  final names = getnames().asyncExpand((value) => reapet3(value));

  await for(String name in names) print(name);
}

Stream<String> getnames() async* {
  yield "google";
  yield "facebook";
  yield "microsoft";
}

Stream<String> reapet3(String value) {
  return Stream.fromIterable(Iterable.generate(3, (_) => value));
}
