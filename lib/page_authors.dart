import 'package:flutter/material.dart';
import 'package:realised_app/helper.dart';
import 'Classes/author.dart';
import 'Classes/quote.dart';
import 'page_author_quotes.dart';

class PageAuthors extends StatefulWidget {
  const PageAuthors({super.key, required this.aList, required this.qList});
  final List<Author> aList;
  final List<Quote> qList;

  @override
  State<PageAuthors> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<PageAuthors> {
  @override
  void initState() {
    super.initState();
    widget.aList.sort((a, b) => a.full_name.compareTo(b.full_name));
  }

  @override
  Widget build(BuildContext context) {
    // Get the top padding (safe area) of the device
    final double topPadding = MediaQuery.of(context).padding.top;

    // Optional: You can add additional padding if needed
    const double additionalPadding = 30.0; // or any other value you see fit

    return Padding(
      padding: EdgeInsets.fromLTRB(0, topPadding, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          children: widget.aList.map((author) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0, //change to 5 for both with shadow
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // creates cut-out shadow but can't offset y propperly as can still see the top
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.5),
                //     offset: const Offset(0, 0),
                //     blurRadius: 6.0,
                //     spreadRadius:
                //         -1, // Negative spread radius to tighten the shadow
                //     blurStyle: BlurStyle.outer, // Use the outer blur style
                //   ),
                // ],
              ),
              child: Card(
                color: Colors.white
                    .withOpacity(0.6), // Keep card color transparent
                elevation: 0,

                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PageAuthorQuotes(
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
                  leading: ImageIcon(
                    AssetImage('assets/head_png/${author.image}'),
                    size: 60.0,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
