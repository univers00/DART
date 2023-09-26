import 'dart:async';

void main() async {
  final allNames = await names()
      .toList(); //attention toList fucntino have wait all data in stream then return result;
  print(allNames);
  //or
  for (String name in allNames) print(name);
}

Stream<String> names() async* {
  yield "google";
  yield "facebook";
  yield "twitter";
  yield "microsoft";
}
