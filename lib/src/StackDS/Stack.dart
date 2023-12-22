// module to implement Srack operation
class Stack<T> {
  final _list = <T>[];

  void push(T val) {
    _list.add(val);
  }

  T pop() {
    return _list.removeLast();
  }

  T peek() {
    return _list.last;
  }

  bool isEmpty() {
    return _list.isEmpty;
  }

  void reset() {
    _list.clear();
  }
}
