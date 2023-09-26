import 'dart:async';

void main() async {
  BroadcastStream();
  //noBroadcastStream();
}

// Stream<String> getNames() async* {
//   yield "google";
//   yield "facebook";
//   yield "microsoft";
// }

void noBroadcastStream() {
  final sc = StreamController();

  sc.sink.add("google");
  sc.sink.add("facebook");
  sc.sink.add("microsoft");

  sc.stream.listen((data) => print(data));
  sc.stream.listen((data) => print(data));
}

void BroadcastStream() async {
  late final StreamController<String> sc;
  sc = StreamController.broadcast();

  //attention we have to intialze the listener before recieve data;

  sc.stream.listen(
    (data) {
      print("whats the fuck");
      print(data);
    },
  );
  sc.stream.listen(
    (data) {
      print("whats the fuck");
      print(data);
    },
  );
  sc.sink.add("google");
  sc.sink.add("facebook");
  sc.sink.add("microsoft");

  sc.close();
}
