import 'dart:async';

void main() async {
  await for (String name in names().AbsorbErrorUseHandler()) print(name);

  await for (String name in names().AbsorbErrorUseHandlers()) print(name);

  await for (String name in names().AbsorbErrorCustom()) print(name);
}

//error handler

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> AbsorbErrorUseHandler() =>
      this.handleError((_, __) {}); // you can use this or not

  Stream<T> AbsorbErrorUseHandlers() =>
      transform(StreamTransformer.fromHandlers(
        handleError: (error, stackTrace, sink) {
          sink.close();
        },
      ));

  Stream<T> AbsorbErrorCustom() => transform(AbsorberError());
}

Stream<String> names() async* {
  yield "google";
  yield "facebook";
  yield "twitter";
  yield "microsoft";
  throw "error be attention";
}

class AbsorberError<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final sc = StreamController<T>();

    stream.listen(
      (data) => sc.sink.add(data),
      onError: (_) {},
      onDone: sc.close,
      cancelOnError: false,
    );

    return sc.stream;
  }
}
