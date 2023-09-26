Stream<String> getModelBenz() async* {
  yield "2000";
  yield "2040";
  yield "2017";
  yield "2110";
  yield "2230";
}

Stream<String> getModelVolvo() async* {
  yield "A02000";
  yield "B02040";
  yield "B02017";
  yield "BA2110";
  yield "BB2230";
}

Stream<String> getAll() async* {
  yield* getModelBenz();
  yield* getModelVolvo();
}

void main() async {
  await for (String model in getAll()) print(model);
}
