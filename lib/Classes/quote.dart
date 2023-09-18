class Quote {
  late int id; // Unique identifier (auto-incremented)
  late String quoteText;
  late int authorId; // References the Author table
  String? from; // Nullable field
  String? title; // Nullable field

  Quote(this.quoteText, this.authorId);
}
