Stream<String> getNames() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield "enzo";
  await Future.delayed(const Duration(seconds: 2));
  yield "unicers00";
}

Stream<String> getCharacters(String name) async* {
  for (int index = 0; index < name.length; index++) {
    yield name[index];
  }
}

void main() async {
  Stream<String> data = getNames().asyncExpand((name) => getCharacters(name));

  await for (var char in data) {
    print(char);
  }
}
