import 'dart:async';

void main() async {
  await for (String name in names.UpperUseMap) print(name);
  print("#####################");
  await for (String name in names.UpperUseMap) print(name);
}

Stream<String> names = Stream.fromIterable([
  "google",
  "facebook",
  "twitter",
  "microsoft",
]);

extension on Stream<String> {
  Stream<String> get UpperUseTransformer => this.transform(ToUpperCase());
  // Stream<String> get Upper => transform(ToUpperCase());

  Stream<String> get UpperUseMap => this.map((data) => data.toUpperCase());
  //Stream<String> get UpperUseMap => map((data) => data.toUpperCase());
}

class ToUpperCase extends StreamTransformerBase<String,
    String> // <String,String> input,output
{
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((data) => data.toUpperCase());
  }
}
