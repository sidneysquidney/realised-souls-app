import 'dart:async';
import 'dart:math';

import 'Classes/author.dart';
import 'Classes/quote.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// returns a random quote from a list of quotes
Quote getRandomQuote(List<Quote> quotes) {
  final random = Random();
  final index = random.nextInt(quotes.length);
  return quotes[index];
}

int getRandomNumber(range) {
  final random = Random();
  final index = random.nextInt(range);
  return index;
}

// takes the json {authors: {1: {...}, 2: {...}}, quotes: {}} and returns a list of authors
List<Author> extractAuthors2(Map<String, dynamic> data) {
  Map<String, dynamic> aMap = data['authors'];
  List<Author> aList = [];
  aMap.forEach((key, value) {
    aList.add(Author(int.parse(key), value['Full Name'], value['Short Bio'],
        value['Dates Alive'], value['Image']));
  });
  return aList;
}

// takes the json {authors: {1: {...}, 2: {...}}, quotes: {}} and returns a list of quotes
List<Quote> extractQuotes2(Map<String, dynamic> data) {
  Map<String, dynamic> qMap = data['quotes'];
  List<Quote> qList = [];
  qMap.forEach((key, value) {
    qList.add(Quote(int.parse(key), value['quote'], value['author'],
        value['title'], value['last_used'], value['count']));
  });
  return qList;
}

List<Quote> extractQuotes(Map<String, dynamic> data) {
  List<Quote> qList = data['quotes'];
  return qList;
}

List<Author> extractAuthors(Map<String, dynamic> data) {
  List<Author> aList = data['authors'];
  return aList;
}

// gets a list of quotes from a given author argument
List<Quote> authorQuotes(List<Quote> qList, String author) {
  List<Quote> aqList = [];
  for (var q in qList) {
    if (q.author == author) {
      aqList.add(q);
      print('correct name: ${q.author}');
    } else {
      print(q.author);
    }
  }
  return aqList;
}

Future<Map<String, dynamic>> loadDataFromJson() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  return json.decode(jsonString);
}

String q = 'sidney';
List<String> ql = ['fhg', 'asdfads', 'up', 'no', 'yo', 'eeeeee', 'joke'];

Timer listTimer([int milliseconds = 10000]) =>
    Timer(Duration(milliseconds: milliseconds), handleHelperTimeout);

void handleHelperTimeout() {
  int randomNo = getRandomNumber(ql.length);
  print(randomNo);
  q = ql[randomNo];
}

String getDate() {
  DateTime now = DateTime.now();
  int year = now.year;
  int month = now.month;
  int day = now.day;

  String formattedDate =
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}'; // Format it as needed
  return formattedDate;
}

Quote getQuoteOfTheDay(List<Quote> qList) {
  String todaysDate = getDate();
  // String testDate = '2026-06-22';
  // todaysDate = testDate;
  late Quote Qod;
  for (var q in qList) {
    if (q.last_used == todaysDate) {
      Qod = Quote(10, q.quote, q.author, q.title, q.last_used, q.count);
      return Qod;
    }
  }
  // if date is out of range of json assigned
  for (var q in qList) {
    if (q.last_used.substring(5) == todaysDate.substring(5)) {
      Qod = Quote(10, q.quote, q.author, q.title, q.last_used, q.count);
      return Qod;
    }
  }
  // if nothing is resolved - this quote returned.
  return Quote(1, 'I am the Spirit', '', '', todaysDate, 0);
}
