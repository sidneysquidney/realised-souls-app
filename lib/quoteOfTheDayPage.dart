import 'package:flutter/material.dart';
import 'package:realised_app/Classes/author.dart';
import 'package:realised_app/Classes/quote.dart';
import 'package:realised_app/helper.dart';

import 'Classes/practiceQuote.dart';
import 'database.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'main.dart';

var quoteOfDay = PracticeQuote(
    'If you prick us do we not bleed? If you tickle us do we not laugh? If you poison us do we not die? And if you wrong us shall we not revenge?',
    'William Shakespeare',
    '');

var quotetest = Quote(10, 'this is the quote', 'autheor', 'titileel', 6);
var quotetest2 = Quote(
    10,
    '''Chapter 1: A Long-Expected Party

When Mr. Bilbo Baggins of Bag End announced that he would shortly be celebrating his eleventy-first birthday with a party of special magnificence, there was much talk and excitement in Hobbiton.

Bilbo was very rich and very peculiar, and had been the wonder of the Shire for sixty years, ever since his remarkable disappearance and unexpected return. The riches he had brought back from his travels had now become a local legend, and it was popularly believed, whatever the old folk might say, that the Hill at Bag End was full of tunnels stuffed with treasure. And if that was not enough for fame, there was also his prolonged vigour to marvel at. Time wore on, but it seemed to have little effect on Mr. Baggins. At ninety he was much the same as at fifty. At ninety-nine they began to call him well-preserved ; but unchanged would have been nearer the mark. There were some that shook their heads and thought this was too much of a good thing; it seemed unfair that anyone should possess (apparently) perpetual youth as well as (reputedly) inexhaustible wealth.

‘It will have to be paid for,’ they said. ‘It isn’t natural, and trouble will come of it!’

But so far trouble had not come; and as Mr. Baggins was generous with his money, most people were willing to forgive him his oddities and his good fortune. He remained on visiting terms with his relatives (except, of course, the Sackville-Bagginses), and he had many devoted admirers among the hobbits of poor and unimportant families. But he had no close friends, until some of his younger cousins began to grow up.

The eldest of these, and Bilbo’s favourite, was young Frodo Baggins. When Bilbo was ninety-nine he adopted Frodo as his heir, and brought him to live at Bag End; and the hopes of the Sackville-Bagginses were finally dashed. Bilbo and Frodo happened to have the same birthday, September 22nd. ‘You had better come and live here, Frodo my lad,’ said Bilbo one day; ‘and then we can celebrate our birthday-parties comfortably together.’ At that time Frodo was still in his tweens, as the hobbits called the irresponsible twenties between childhood and coming of age at thirty-three.''',
    'autheor',
    'titileel',
    6);

final quote = quoteOfDay;

class QuoteOfTheDayPage extends StatefulWidget {
  const QuoteOfTheDayPage({super.key, required this.qList});
  final List<Quote> qList;

  @override
  State<QuoteOfTheDayPage> createState() => _QuoteOfTheDayPageState();
}

class _QuoteOfTheDayPageState extends State<QuoteOfTheDayPage> {
  List<Quote> quotesList = [];
  Quote quoteOfTheDay = quotetest2;
  Timer? timer;
  int starter = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 100), (Timer t) => checkForNewSharedLists());
    // Perform initialization tasks here
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void checkForNewSharedLists() {
    // do request here
    setState(() {
      starter += 1;
      quoteOfTheDay = getRandomQuote(widget.qList);
      // change state according to result of request
    });
  }

  void buttonPress() async {
    AddToAuthors();
    List<Author> al = await getAuthors();
    print('authors');
    print(al);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (quoteOfTheDay.title.isNotEmpty)
                Text(
                  quoteOfTheDay.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              if (quoteOfTheDay.title.isNotEmpty)
                const SizedBox(
                  height: 20,
                ),
              Text(
                quoteOfTheDay.quote,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                quoteOfTheDay.author,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    quoteOfTheDay = getRandomQuote(widget.qList);
                    buttonPress();
                  });
                },
                child: const Text('Add Data to Firebase'),
              ),
              Text((starter.toString())),
              Text(getDate())
            ],
          ),
        ),
      ),
    );
  }
}
