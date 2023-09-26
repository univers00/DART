import 'dart:async';

void main() {
//methode 1
//getData().listen((i)=>print(i));

//methode 1
//getData().listen((i)=>print(i));

//methode 3
//getData().listen(
//  (data)=>print(data),
//  onError:(e)=>print("Error : => ${e}"),
//  cancelOnError:false,
//  onDone:()=>print("Data is completed."),
//);

//methode 4
  // StreamSubscription<int>? stream;
//stream = getData().listen(
//  (data){
//    if(data == 5){
//      stream!.cancel();
//    }
//   print(data);
//  },
//  onError:(e)=>print("Error : => $e"),
//  cancelOnError:false,
//  onDone:()=>print("Data is completed."),
//);

//methode 5
// manipulat the data before give them to listener.
  // StreamSubscription<int>? stream;
  // stream = getData().map((data) => data + 1).listen(
  //   (data) {
  //     if (data == 5) {
  //       stream!.cancel();
  //     }
  //     print(data);
  //   },
  //   onError: (e) => print("Error : => $e"),
  //   cancelOnError: false,
  //   onDone: () => print("Data is completed."),
  // );

// methode 6
// if data % 2 == 0 egal true, function where will return Data.

  // StreamSubscription<int>? stream;
  // stream = getData().where((data) => data % 2 == 0).listen(
  //   (data) {
  //     print(data);
  //   },
  //   onError: (e) => print("Error : => $e"),
  //   cancelOnError: false,
  //   onDone: () => print("Data is completed."),
  // );

// methode 7
//exemple 1 to 6 can have one listener
// exemple 7 can have multi listener ==> becouse ==> asBrodcastStream()

  Stream<int>? stream;
  stream = getData().asBroadcastStream();

  stream.listen(
    (data) {
      print("listener 1 => $data");
    },
    onError: (e) => print("Error : => $e"),
    cancelOnError: false,
    onDone: () => print("Data is completed."),
  );

  stream.listen(
    (data) {
      print("listener 2 => $data");
    },
    onError: (e) => print("Error : => $e"),
    cancelOnError: false,
    onDone: () => print("Data is completed."),
  );
}

//methode 1
//Stream<int> getData(){
//  return Stream.periodic(const Duration(seconds:2),(i)=>i);
//}

//methode 2
//Stream<int> getData()async*{
//
//  for(int index = 0 ;index<30 ;index++){
//    await Future.delayed(const Duration(seconds:2),(){});
//    //just to make a delay,
//    yield index;
//    //we use yield becouse if we use return to function will be stoped,
//    //we most add async* to use keyword yield
//         }
//  }

//methode 3
//Stream<int> getData()async*{
//
//  for(int index = 0 ;index<10 ;index++){
//    await Future.delayed(const Duration(seconds:2),(){});
//    //just to make a delay,
//    yield index;
//    //we use yield becouse if we use return to function will be stoped,
//    //we most add async* to use keyword yield
//         }
//  }

//methode 4=>5=>6=>7
Stream<int> getData() async* {
  for (int index = 0; index < 10; index++) {
    await Future.delayed(const Duration(seconds: 2), () {});
    //just to make a delay,
    yield index;
    //we use yield becouse if we use return to function will be stoped,
    //we most add async* to use keyword yield
  }
}
