import 'package:flutter/material.dart';
import 'package:realised_app/authorsPage.dart';
import 'package:realised_app/infoPage.dart';
import 'package:realised_app/quoteOfTheDayPage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/bgmulti.jpeg', // Replace with your image path
        fit: BoxFit.cover, // Adjust the fit as needed
        width: double.infinity,
        height: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(['', 'Realised Souls', 'Info & About'][currentPageIndex]),
          centerTitle: true,
          elevation: 0,
        ),
        body: [
          const QuoteOfTheDayPage(),
          const AuthorsPage(),
          const InfoPage(),
          // const QuotesPage()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
    ]);
  }
}
