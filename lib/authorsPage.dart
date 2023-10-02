import 'package:flutter/material.dart';
import 'package:realised_app/Classes/customBoxShadow.dart';
import 'package:realised_app/Classes/practiceAuthor.dart';
import 'package:realised_app/Classes/practiceList.dart';
import 'package:realised_app/helper.dart';

import 'Classes/author.dart';
import 'Classes/quote.dart';
import 'authorQuotesPage.dart';
import 'database.dart';

var abe =
    PracticeAuthor('Abraham Lincoln', '16th President of the United States');

var rumi = PracticeAuthor('Rumi', 'Sufi mystic and poet');

var will =
    PracticeAuthor('William Blake', 'Everyones faveourite realised soul');

var charles = PracticeAuthor('Charles Dickens', '19th century English writer');

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({super.key, required this.aList, required this.qList});
  final List<Author> aList;
  final List<Quote> qList;

  @override
  State<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: widget.aList.map((author) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 0,
                ),
                color:
                    Colors.white.withOpacity(0.6), // White and 60% transparent
                elevation: 0, // Set elevation to 0 for a transparent card
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AuthorQuotesPage(
                          author_name: author.full_name,
                          quotes: authorQuotes(widget.qList, author.full_name),
                        ),
                      ),
                    );
                  },
                  title: Text(
                    author.full_name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    author.short_bio,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  leading: const ImageIcon(
                    AssetImage('assets/AbeIcon.png'),
                    size: 60.0,
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
