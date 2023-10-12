import 'package:flutter/material.dart';
import 'package:realised_app/Classes/quote.dart';
import 'package:realised_app/helper.dart';

import 'database.dart';
import 'dart:async';

class PageQod extends StatefulWidget {
  const PageQod({super.key, required this.qList});
  final List<Quote> qList;

  @override
  State<PageQod> createState() => _QuoteOfTheDayPageState();
}

class _QuoteOfTheDayPageState extends State<PageQod> {
  List<Quote> quotesList = [];
  late Quote quoteOfTheDay;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 100), (Timer t) => updateQod());
    quoteOfTheDay = getQuoteOfTheDay(widget.qList);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void updateQod() {
    setState(() {
      quoteOfTheDay = getQuoteOfTheDay(widget.qList);
    });
  }

  void buttonPress() async {
    addToDatabase();
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
                quoteOfTheDay.quote.replaceAll('\\n', '\n'),
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
              // ElevatedButton(
              //   onPressed: () async {
              //     setState(() {
              //       buttonPress();
              //     });
              //   },
              //   child: const Text('Add Data to Firebase'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
