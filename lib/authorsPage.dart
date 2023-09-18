import 'package:flutter/material.dart';
import 'package:realised_app/Classes/customBoxShadow.dart';
import 'package:realised_app/Classes/practiceAuthor.dart';
import 'package:realised_app/Classes/practiceList.dart';

import 'authorQuotesPage.dart';

var abe =
    PracticeAuthor('Abraham Lincoln', '16th President of the United States');

var rumi = PracticeAuthor('Rumi', 'Sufi mystic and poet');

var will =
    PracticeAuthor('William Blake', 'Everyones faveourite realised soul');

var charles = PracticeAuthor('Charles Dickens', '19th century English writer');

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({super.key});

  @override
  State<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  var items = [
    rumi,
    charles,
    will,
    abe,
    rumi,
    charles,
    will,
    abe,
    rumi,
    charles,
    will,
    abe
  ];

  var quotes = lincolnQuotes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ), // Adjust the margin as needed
            color: Colors.white.withOpacity(0.6), // White and 60% transparent
            elevation: 0, // Set elevation to 0 for a transparent card
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AuthorQuotesPage(
                      author: items[index],
                      quotes: quotes,
                    ),
                  ),
                );
              },
              title: Text(items[index].name),
              subtitle: Text(items[index].bio),
              leading: const ImageIcon(
                AssetImage('assets/AbeIcon.png'),
                size: 60.0, // Set the icon size as needed
              ),
            ),
          );
        },
      ),
    );
  }
}
