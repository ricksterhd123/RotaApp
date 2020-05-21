/*
  Map for List<Object>
*/
List<T> map<T, F>(List<F> list, Function f) {
  List<T> result = new List<T>();
  for (var i = 0; i < list.length; i++) {
    result.add(f.call(i, list[i]));
  }
  return result;
}