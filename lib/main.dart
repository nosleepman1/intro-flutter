import 'package:flutter/material.dart';

// 1. La fonction principale (le point d'entrée de l'application)
void main() {
  // runApp dit à Flutter de démarrer notre application
  runApp(MaPremiereApp());
}

// 2. Le widget racine de notre application
class MaPremiereApp extends StatelessWidget {
  const MaPremiereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false, // Enlève le petit bandeau "DEBUG"
      title: 'Mon App Débutant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageAccueil(), // C'est la page qui s'affiche au lancement
    );
  }
}

// 3. Notre page d'accueil (Stateful = son état/contenu peut changer)
class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  // 4. Une variable pour stocker notre texte
  String message = "Bonjour et bienvenue ! ";

  // 5. Une fonction qui change le texte quand on clique sur le bouton
  void changerMessage() {
    setState(() {
      // setState dit à Flutter : "L'écran a changé, redessine-le !"
      message = "Bravo, tu as créé ta première app Flutter ! ";
    });
  }

  // 6. La fonction build qui dessine l'écran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold est la structure classique d'une page (avec une barre en haut, un corps, etc.)
      appBar: AppBar(
        title: Text("Ma Première App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        // Center place ses enfants au milieu de l'écran
        child: Column(
          // Column aligne ses enfants de haut en bas
          mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
          children: [
            // Le texte qui affiche notre variable 'message'
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 30), // Un espace vide de 30 pixels
            
            // Le bouton cliquable
            ElevatedButton(
              onPressed: changerMessage, // Ce qu'il se passe quand on clique
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text(
                "Clique ici !",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
