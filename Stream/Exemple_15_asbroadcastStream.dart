void main() async {
  final name = getNames().asBroadcastStream();
  name.listen((data) {
    print(data);
  });

  name.listen((data) {
    print(data);
  });
}

Stream<String> getNames() async* {
  yield "google";
  yield "facebook";
  yield "microsoft";
}
