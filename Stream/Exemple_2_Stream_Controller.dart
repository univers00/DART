import 'dart:async';

class GetData {
  final StreamController<int> sc = StreamController<int>();
  int counter = 0;

  GetData() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      sc.sink.add(counter);

      if (counter == 20) timer.cancel();
      counter++;
    });
  }

  Stream<int> get data {
    print("fetch data");
    return sc.stream;
  }
}

void main() {
  var result = GetData();

  result.data.listen((data) {
    print(data);
  });
}
