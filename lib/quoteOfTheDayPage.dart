import 'package:flutter/material.dart';
import 'package:realised_app/Classes/quote.dart';

import 'Classes/practiceQuote.dart';

var quoteOfDay = PracticeQuote(
    'If you prick us do we not bleed? If you tickle us do we not laugh? If you poison us do we not die? And if you wrong us shall we not revenge?',
    'William Shakespeare',
    '');

var quoteOfDay2 = PracticeQuote('''I wandered lonely as a cloud
That floats on high o'er vales and hills,
When all at once I saw a crowd,
A host, of golden daffodils;
Beside the lake, beneath the trees,
Fluttering and dancing in the breeze.

Continuous as the stars that shine
And twinkle on the milky way,
They stretched in never-ending line
Along the margin of a bay:
Ten thousand saw I at a glance,
Tossing their heads in sprightly dance.

The waves beside them danced; but they
Out-did the sparkling waves in glee:
A poet could not but be gay,
In such a jocund company:
I gazed—and gazed—but little thought
What wealth the show to me had brought:

For oft, when on my couch I lie
In vacant or in pensive mood,
They flash upon that inward eye
Which is the bliss of solitude;
And then my heart with pleasure fills,
And dances with the daffodils.''', 'William Wordsworth',
    'I wandered lonely as a cloud');
final quote = quoteOfDay;

class QuoteOfTheDayPage extends StatelessWidget {
  const QuoteOfTheDayPage({super.key});

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
              if (quote.title.isNotEmpty)
                Text(quote.title,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(decoration: TextDecoration.underline)),
              if (quote.title.isNotEmpty)
                const SizedBox(
                  height: 20,
                ),
              Text(
                quote.quoteText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                quote.author,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontFamily: 'Georgia'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
