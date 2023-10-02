import 'package:flutter/material.dart';
import 'package:realised_app/authorsPage.dart';
import 'package:realised_app/helper.dart';
import 'package:realised_app/infoPage.dart';
import 'package:realised_app/quoteOfTheDayPage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Classes/author.dart';
import 'Classes/quote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.data});
  final String title;
  final Map<String, dynamic> data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  // final List<Author> aList = [];
  // final List<Quote> qList = [];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/bgmulti.jpeg', // Replace with your image path
        fit: BoxFit.cover, // Adjust the fit as needed
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
            bottomOpacity: 0.0,
            scrolledUnderElevation: 0,
            title: Text(
              ['', 'Realised Souls', 'Info & About'][currentPageIndex],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: [
            QuoteOfTheDayPage(qList: extractQuotes(widget.data)),
            AuthorsPage(
                aList: extractAuthors(widget.data),
                qList: extractQuotes(widget.data)),
            const InfoPage(),
            // const QuotesPage()
          ][currentPageIndex],
          bottomNavigationBar: NavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.om), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.apps_rounded), label: 'Authors'),
              NavigationDestination(
                  icon: Icon(Icons.info_outline), label: 'Info'),
              // NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
            ],
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) =>
                {setState(() => currentPageIndex = index)},
            // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          ),
        ),
      ),
    ]);
  }
}
