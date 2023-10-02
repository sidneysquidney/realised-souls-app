class Quote {
  late int id; // Unique identifier (auto-incremented)
  late String quote;
  late String author; // References the Author table
  late String title; // Nullable field
  late int count;

  Quote(this.id, this.quote, this.author, this.title, this.count);

  Map<String, dynamic> ToJson() {
    return {'quote': quote, 'author': author, 'title': title, 'count': count};
  }
}
