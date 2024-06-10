class Pagination<T> {
  int count;
  String? next;
  String? previous;
  List<T> results;

  Pagination({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
