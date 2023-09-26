import 'dart:async';

void main() {
  getNames().withTimeOut().listen((data) {
    print(data);
  });
}

Stream<String> getNames() async* {
  yield "google";
  await Future.delayed(Duration(milliseconds: 10));
  yield "facebook";
  await Future.delayed(Duration(milliseconds: 30));
  yield "drive";
  await Future.delayed(Duration(milliseconds: 100));
  yield "LG";
}

extension timeOut<T> on Stream<T> {
  Stream<T> withTimeOut() => transform(TimeOut());
}

class TimeOut<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    StreamController<T>? sc;
    StreamSubscription<T>? ss;
    Timer? t;
    sc = StreamController<T>(
      onListen: () {
        ss = stream.listen(
          (data) {
            t?.cancel();
            t = Timer.periodic(Duration(milliseconds: 50), (_) {
              sc?.addError(TimeOutError("time out error"));
            });
            sc?.add(data);
          },
          onError: sc?.addError,
          onDone: () async {
            await sc?.close();
          },
        );
      },
      onCancel: () {
        ss?.cancel();
        t?.cancel();
      },
    );
    return sc.stream;
  }
}

class TimeOutError implements Exception {
  late final String text;
  TimeOutError(this.text);
}
