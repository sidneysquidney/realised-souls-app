import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageInfo extends StatefulWidget {
  const PageInfo({super.key});

  @override
  State<PageInfo> createState() => _InfoPageState();
}

class _InfoPageState extends State<PageInfo> {
  bool receiveNotifications = false;
  TimeOfDay selectedTime = TimeOfDay.now();

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    setState(() {
      selectedTime = newTime!;
    });
  }

  void changeNotifications() async {
    // TODO: Request permission
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
    // TODO: Register with FCM
    // It requests a registration token for sending messages to users from your App server or other trusted server environment.
    String? token = await messaging.getToken();

    if (kDebugMode) {
      print('Registration Token=$token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings", style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Notifications"),
                    Opacity(
                        opacity: 0.6,
                        child: Text("Receive a daily notification")),
                  ],
                ),
                Opacity(
                  opacity: 0.6,
                  child: Switch(
                      value: receiveNotifications,
                      onChanged: (value) {
                        setState(() {
                          receiveNotifications = value;
                        });
                        changeNotifications();
                      }),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text("Time of daily notification"),
            GestureDetector(
              onTap: _selectTime,
              child: Opacity(
                  opacity: 0.6,
                  child: Text(
                      "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}")),
            ),
            const SizedBox(height: 25),
            const Text("About", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text(
                "A realised soul is someone of great spiritual awareness and depth, we could say they have achieved their “enlightenment”. This app aims to be a humble collection of the wisdom offered by these realised souls, so that we may use them to learn and grow ourselves."),
            const SizedBox(height: 10),
            const Text(
                "The collection is by no means exhausted but simply a list of my personal favourites. It will be updated frequently as I continue my never-ending journey. "),
            const SizedBox(height: 30),
            const Text("A side note",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text(
                "While quotes can put across an idea in a beautiful and concise way, giving us their essence, they often gain another dimension when put in context. If you like something, find out where it comes from, be it a poem, a novel, or a speech, so that you may enjoy it in its intended form, with all of its meaning, beauty, and subtlety."),
            const SizedBox(height: 30),
            const Text("A second side note",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text(
                "As I was creating this app I noticed many seemingly opposing ideas, standing up for what is right vs turning the other cheek, being content vs striving for your dreams, and being your own master vs surrendering to the will of the universe. How do we make sense of these contradictions. Let me respond in the spirit of this project, with a Rumi poem."),
            const SizedBox(height: 25),
            const Text(
              '''"Some Hindus have an elephant to show.
No one here has ever seen an elephant.
They bring it at night to a dark room.

One by one, we go in the dark and come out
saying how we experience the animal.
One of us happens to touch the trunk.
A water-pipe kind of creature.

Another, the ear. A very strong, always moving
back and forth, fan-animal. Another, the leg.
I find it still, like a column on a temple.

Another touches the curved back.
A leathery throne. Another the cleverest,
feels the tusk. A rounded sword made of porcelain.
He is proud of his description.

Each of us touches one place
and understands the whole that way.
The palm and the fingers feeling in the dark
are how the senses explore the reality of the elephant.

If each of us held a candle there,
and if we went in together, we could see it."''',
            ),
            const SizedBox(height: 25),
            const Text(
                "Each quote or poem is like each person going to see the elephant, they are beautiful and complete by themselves, yet still only a part of the whole truth. It is our job to be the light. The light is our awareness, and by expanding our awareness we can understand how all these seemingly opposing ideas are all true when put in context and understanding of the whole."),
            const SizedBox(height: 30),
            const Text("Development",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text("This app was developed by Siddhartha Lethbridge."),
            const SizedBox(height: 10),
            const Opacity(
                opacity: 0.6,
                child: Text("https://www.siddharthalethbridge.com/")),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
