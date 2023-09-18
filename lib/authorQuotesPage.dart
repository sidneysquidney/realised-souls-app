import 'package:flutter/material.dart';
import 'package:realised_app/Classes/practiceAuthor.dart';

class AuthorQuotesPage extends StatelessWidget {
  final PracticeAuthor author;
  final List<String> quotes;

  const AuthorQuotesPage({Key? key, required this.author, required this.quotes})
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
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(author.name),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  color:
                      Colors.white.withOpacity(1), //set to 0.6 for transparency
                  elevation: 4, // Set elevation to 0 for a transparent card
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(quotes[index]),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
