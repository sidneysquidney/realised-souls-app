import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realised_app/helper.dart';
import 'Classes/quote.dart';
import 'Classes/author.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
final authorsReference = databaseRef.child('authors');
final quotesReference = databaseRef.child('quotes');

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void addToDatabase() {
  databaseRef.child('big').set('small'); //add to root
}

void AddToAuthors() {
  //adds to authors with random key
  authorsReference.push().set({
    'bio': 'Creator of this app',
    'name': 'Siddhartha Lethbridge',
    'date_range': '1995-2023',
    'image': 'assets/AbeIcon.png'
  });
  print('sids objects test');
}

void AddToQuotes() {
  quotesReference.push().set({
    "author": "Siddhartha Lethbridge",
    "count": 0,
    "quote": "Mother you do everything."
  });
  print('mother you do all text print');
}

void editQuote() {
  // update function
  final quoteReference = databaseRef.child('quotes/-Neh-czHx0OiPbbuLYb_');
  quoteReference.update({'quote': 'I am the spirit'});
}

void ReadQuote() {
  DatabaseReference DbRef = FirebaseDatabase.instance.ref('quotes/2');
  DbRef.onValue.listen((DatabaseEvent event) {
    dynamic data = event.snapshot.value;
    print('sid was right');
    if (data != null) {
      print(data['count']);
    }
    print(data['count']);
    print(data); // updateStarCount(data);
    return data;
  });
}

// Future<String> eventSnap() async {
//   Completer<String> completer = Completer<String>();

//   DatabaseReference eventSnapRef =
//       FirebaseDatabase.instance.ref('authors/2/full_name');

//   eventSnapRef.onValue.listen((DatabaseEvent event) async {
//     final name = event.snapshot.value;
//     completer.complete(name as FutureOr<String>?);
//   });

//   return completer.future;
// }

Future<List<Quote>> getQuotes() async {
  Completer<List<Quote>> completer = Completer<List<Quote>>();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref('quotes/');
  dbRef.onValue.listen((event) async {
    dynamic data = event.snapshot.value;
    List<Quote> quoteList = [];

    if (data != null) {
      for (var quoteData in data) {
        Quote quote = Quote(
          10, // Use the key as the quote ID
          quoteData['quote'],
          quoteData['author'],
          '',
          quoteData['count'],
        );
        quoteList.add(quote);
      }
    }

    // Complete the Future with the quoteList
    completer.complete(quoteList);
  });

  // Return the Future
  return completer.future;
}

Future<List<Author>> getAuthors() async {
  List<Author> authorList = [];

  DatabaseReference dbRef = FirebaseDatabase.instance.ref('authors/');
  DataSnapshot snapshot =
      (await dbRef.once()) as DataSnapshot; // Wait for data once

  dynamic data = snapshot.value;
  if (data != null) {
    for (var authorData in data) {
      Author author = Author(
        10, // Use the key as the author ID
        authorData['full_name'],
        authorData['short_bio'],
        authorData['dates_alive'],
        authorData['image'],
      );
      authorList.add(author);
    }
  }

  return authorList;
}

// gets an author by searching for their id
void getSingleAuthor(String authorId) {
  DatabaseReference DbRef = FirebaseDatabase.instance.ref('authors/$authorId');
  DbRef.onValue.listen((DatabaseEvent event) {
    dynamic data = event.snapshot.value;
    var author = Author(int.parse(authorId), data['full_name'],
        data['short_bio'], data['dates_alive'], data['image']);

    print(author.short_bio);
  });
}

void updateDate(quoteId) async {
  await quotesReference.child(quoteId.toString()).update({
    "last_date": getDate(),
  });
// Only update the name, leave the age and address!
}

// // get all quotes from a particular author
// void getAuthorQuotes(authorId) {
//   List<Quote> quoteList = [];

//   DatabaseReference DbRef = FirebaseDatabase.instance.ref('/');
//   DbRef.onValue.listen((DatabaseEvent event) {
//     dynamic data = event.snapshot.value;
//     print(data);
//     for (var q in data.keys) {
//       Quote quote = Quote();
//       quoteList.add(quote);
//     }
//     print(quoteList);
//   });
// }

// void getRandomQuote() {
//   List<Quote> quoteList = [];

//   DatabaseReference DbRef = FirebaseDatabase.instance.ref('quotes/');
//   DbRef.onValue.listen((DatabaseEvent event) {
//     dynamic data = event.snapshot.value;
//     print(data);
//     for (var q in data.keys) {
//       Quote quote =
//           Quote(q, data['quote'], data['author'], data['title'], data['count']);
//       quoteList.add(quote);
//     }
//     print(quoteList);
//   });
// }

// get the id for the author on get authors
// make that list the list thats looped through on the authors page
// get random quote from all quotes
// get all quotes from an author
// make that the list thats displyaed on quthorquotes page
