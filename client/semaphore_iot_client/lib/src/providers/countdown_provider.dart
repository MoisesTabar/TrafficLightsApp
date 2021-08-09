class CountdownProvider {
  late int initialValue; 

  CountdownProvider({
    required this.initialValue
  });

  Stream<int> get countdown async* {
    int i = initialValue;
    while(i != 0){
      await Future.delayed(Duration(seconds: 1), (){
        i--;
      });

      yield i;

      while(i == 0){
        i = initialValue;
      }
    }
  }
}