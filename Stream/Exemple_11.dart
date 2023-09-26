import 'dart:async';

void main() async {
  //buid in function
  await for (String name in names().handleError((e) => print(e))) print(name);
}

//error handler

Stream<String> names() async* {
  yield "google";
  yield "facebook";
  yield "twitter";
  yield "microsoft";
  throw "error be attention";
}
