import 'dart:async';

void main() async {
  final sc = StreamController();
  sc.sink.add("univers00");
  sc.sink.add("say");
  sc.sink.add("hi");
  sc.sink.add("/");
  await for (String word in sc.stream) print(word);
}
