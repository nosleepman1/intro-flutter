import 'package:flutter/material.dart';
import 'package:intro/pages/Actus.dart';
import 'package:intro/pages/Calls.dart';
import 'package:intro/pages/Communities.dart';
import 'package:intro/pages/Discussion.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white
      ),
      home: App(),

    )
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return HomePage();
  }
}

class HomePage extends State<App> {

  final pages = [
    Discussion(),
    Actus(),
    Communities(),
    Calls()
  ];

  int index  = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${whatsappItems[index].label}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Icon(Icons.settings, size: 30,)
              ],
          ),
          elevation: 100,
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          destinations: whatsappItems,
          onDestinationSelected: (int index) {
            setState(() {
              this.index = index;
            });
          } ),
    );
  }
}

List<NavigationDestination> whatsappItems = const [
  NavigationDestination(
    icon: Icon(Icons.chat_outlined),
    selectedIcon: Icon(Icons.chat),
    label: 'Discussions',
  ),
  NavigationDestination(
    icon: Icon(Icons.update_outlined),
    selectedIcon: Icon(Icons.update),
    label: 'Actus',
  ),
  NavigationDestination(
    icon: Icon(Icons.groups_outlined),
    selectedIcon: Icon(Icons.groups),
    label: 'Communautés',
  ),
  NavigationDestination(
    icon: Icon(Icons.call_outlined),
    selectedIcon: Icon(Icons.call),
    label: 'Appels',
  ),
];