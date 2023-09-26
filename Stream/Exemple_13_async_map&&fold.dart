void main() async {
//  accept async function
  final name = await getNames().asyncMap((data) => extractChar(data)).fold('',
      (previous, element) {
    final elements = element.join("!");
    print("pre => $previous");
    print("pre => $element");
    return "$previous $elements";
  });

  print(name);
}

Stream<String> getNames() async* {
  yield "google";
  yield "youtube";
  yield "Drive";
  yield "Gmail";
}

Future<List<String>> extractChar(String word) async {
  final chars = <String>[];

  for (String char in word.split('')) {
    await Future.delayed(Duration(milliseconds: 50), () => chars.add(char));
  }

  return chars;
}
