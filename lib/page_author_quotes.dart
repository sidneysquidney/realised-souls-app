import 'package:flutter/material.dart';
import 'Classes/quote.dart';

class PageAuthorQuotes extends StatelessWidget {
  final String author_name;
  final List<Quote> quotes;
  static const seedColor = Color(0xFF6F665A);

  const PageAuthorQuotes(
      {Key? key, required this.author_name, required this.quotes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bgmulti.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: quotes.map((quote) {
                    return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 0,
                        ),
                        color: Colors.transparent, // White and 60% transparent
                        elevation:
                            0, // Set elevation to 0 for a transparent card
                        // child: Text(
                        //   quote.quote.replaceAll('\\n', '\n'),
                        //   style: Theme.of(context).textTheme.bodyMedium,
                        // ),

                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(
                                  8), // Adjust the radius as needed
                            ),
                            padding: const EdgeInsets.all(
                                16), // Adjust the padding as needed
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (quote.title.isNotEmpty)
                                  Text(
                                    '${quote.title}\n',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                Text(
                                  quote.quote.replaceAll('\\n', '\n'),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        )
                        // title: (quote.title.isNotEmpty)
                        //     ? Text(
                        //         '${quote.title}\n',
                        //         style:
                        //             Theme.of(context).textTheme.titleMedium,
                        //       )
                        //     : null, // Set title to null if it's empty

                        // subtitle: Text(
                        //   quote.quote.replaceAll('\\n', '\n'),
                        //   style: Theme.of(context).textTheme.bodyMedium,
                        // ),

                        );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
