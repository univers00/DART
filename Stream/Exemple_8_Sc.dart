import 'dart:async';

void main() async {
  //await for (String name in names) print(name.toUpperCase());

  await for (String name in names.map((name) => name.toUpperCase()))
    print(name);
}

Stream<String> names = Stream.fromIterable([
  "google",
  "facebook",
  "twitter",
  "microsoft",
]);
