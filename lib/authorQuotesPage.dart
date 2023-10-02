import 'package:flutter/material.dart';
import 'package:realised_app/Classes/practiceAuthor.dart';

import 'Classes/author.dart';
import 'Classes/quote.dart';
import 'fooDecoration.dart';

class AuthorQuotesPage extends StatelessWidget {
  final String author_name;
  final List<Quote> quotes;
  static const seedColor = Color(0xFF6F665A);

  const AuthorQuotesPage(
      {Key? key, required this.author_name, required this.quotes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bgyellow.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  author_name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                scrolledUnderElevation: 0,
                centerTitle: true,
                leading: IconButton(
                  iconSize: 20,
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        seedColor, // Set the background color to seedColor
                    // You can also customize other button properties here, like padding, textStyle, etc.
                  ),
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: quotes.map((quote) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 0,
                          ),
                          color: Colors.white
                              .withOpacity(0.6), // White and 60% transparent
                          elevation:
                              0, // Set elevation to 0 for a transparent card
                          child: ListTile(
                            title: Text(
                              quote.quote,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ))),
        ),
      ],
    );
  }
}
