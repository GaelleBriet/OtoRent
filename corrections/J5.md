# Correction
Après une installation longue et éprouvante, il est maintenant temps de s'amuser avec le développement multiplateforme et plus particulièrement le dev mobile 🥳

> ⚠️ Le code du projet présente quelques différences avec le contenu détaillé au sein de ce fichier de correction (notamment l'externalisation des données factices au sein d'un fichier distinct).

## Flutter
### Initialisation
Avant toute chose, il faut que l'on se crée un projet pour développer notre application Flutter.
Sur le site de Flutter, il n'y a pas vraiment de bon tuto pour démarrer rapidement une application *(c'est une vidéo, qui a le temps pour ça ??? 🙄)*. Par contre, j'ai déniché un petit tuto piqué sur Google qui fera largement l'affaire :
https://www.vogella.com/tutorials/FlutterCreatingProjects/article.html
C'est parti, on lance la première ligne de commande à la racine du repo :
`flutter create oto_rent`
Et paf, tout le projet est déjà en place avec une petite application fonctionnelle qui est un compteur de click *(souvenirs souvenirs...)*

### Adaptation
Tout le développement de l'application se fera dans le dossier `lib`.
En installant le projet Flutter, ce dossier existe déjà avec un fichier `main.dart` à l'intérieur, on va le modifier pour gagner du temps 😎
```dart
import  'package:flutter/material.dart';

// Fonction principale pour lancer l'application
void  main() {
  // L'application lue se nomme MyApp
  runApp(const  MyApp());
}

class  MyApp  extends  StatelessWidget {
  const  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget  build(BuildContext  context) {
    return  MaterialApp(
      title:  "O'to Rent",
      theme:  ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor:  Colors.deepPurple),
        useMaterial3:  true,
      ),
      // La page d'accueil de l'application
      home:  const  MyHomePage(title:  "O'to Rent"),
    );
  }
}

// On ne veut pas étendre StatefullWidget pour le moment, on ne gère pas d'état
class  MyHomePage  extends  StatelessWidget {
  const  MyHomePage({super.key, required  this.title});

  final  String  title;

  @override
  Widget  build(BuildContext  context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor:  Theme.of(context).colorScheme.inversePrimary,
        title:  Text(title),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:  <Widget>[
            const  Text('Coucou')
          ],
        ),
      ),
    );
  }
}
```
Et voilà ! On a maintenant une magnifique page qui dit "Coucou". Il est temps de s'attaquer au développement pur 💥

## Exercice
### Importer les voitures
Dans notre classe `MyHomePage`, on va définir les véhicules de notre page d'accueil :
```dart
static var vehicules = [
  {
    'mark': 'Audi',
    'model': 'A3',
    'zeroto100': 5.9,
    'energyClass': 'B',
    'power': 110,
    'topspeed': 200,
    'pic': 'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
    'location': 'Paris',
    'price': 79.0
  },
  {
    'mark': 'Audi',
    'model': 'A4',
    'zeroto100': 7.9,
    'energyClass': 'B',
    'power': 110,
    'topspeed': 200,
    'pic': 'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
    'location': 'Nantes',
    'price': 79.0
  },
  {
    'mark': 'Audi',
    'model': 'A5',
    'zeroto100': 8.9,
    'energyClass': 'B',
    'power': 110,     
    'topspeed': 200,
    'pic': 'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
    'location': 'Marseille',
    'price': 79.0
  },
  {
    'mark': 'Audi',
    'model': 'A6',
    'zeroto100': 17.9,
    'energyClass': 'B',
    'power': 110,
    'topspeed': 200,
    'pic': 'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
    'location': 'Paris',
    'price': 79.0
  },
  {
    'mark': 'Audi',
    'model': 'A7',
    'zeroto100': 17.9,
    'energyClass': 'B',
    'power': 110,
    'topspeed': 200,
    'pic': 'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
    'location': 'Paris',
    'price': 79.0
  },
];

final String title;
```
Et maintenant il faut parcourir cette variable pour l'afficher convenablement sur notre page.
Tout d'abord, on veut que l'affichage se fasse de manière verticale, en colonne. Heureusement pour nous, Flutter propose des layouts pour aligner des éléments selon nos envies :
https://api.flutter.dev/flutter/widgets/Column-class.html

Ensuite, on aimerait créer des espaces entre nos différents éléments (titre, liste).
Pour ce faire, nous avons les [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html) qui permettent de créer des boites avec une hauteur définie.

Puis on crée une liste à partir de nos jolies voitures, en utilisant [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html).

Enfin, pour que nos voitures soient bien mises en valeur, on peut utiliser la classe [Card](https://api.flutter.dev/flutter/material/Card-class.html).

On mixe le tout :
```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  static var vehicules = [
    {
      'mark': 'Audi',
      'model': 'A3',
      'zeroto100': 5.9,
      'energyClass': 'B',
      'power': 110,
      'topspeed': 200,
      'pic':
          'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
      'location': 'Paris',
      'price': 79.0
    },
    {
      'mark': 'Audi',
      'model': 'A4',
      'zeroto100': 7.9,
      'energyClass': 'B',
      'power': 110,
      'topspeed': 200,
      'pic':
          'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
      'location': 'Nantes',
      'price': 79.0
    },
    {
      'mark': 'Audi',
      'model': 'A5',
      'zeroto100': 8.9,
      'energyClass': 'B',
      'power': 110,
      'topspeed': 200,
      'pic':
          'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
      'location': 'Marseille',
      'price': 79.0
    },
    {
      'mark': 'Audi',
      'model': 'A6',
      'zeroto100': 17.9,
      'energyClass': 'B',
      'power': 110,
      'topspeed': 200,
      'pic':
          'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
      'location': 'Paris',
      'price': 79.0
    },
    {
      'mark': 'Audi',
      'model': 'A7',
      'zeroto100': 17.9,
      'energyClass': 'B',
      'power': 110,
      'topspeed': 200,
      'pic':
          'https://www.audi-macon.fr/content/dam/iph/generic-assets/models/a4/a4-limousine-2019/stage/4096x1280_AA4_L_191004.jpg/_jcr_content/renditions/cq5dam.thumbnail.720.406.iph.png?imwidth=720&imdensity=1',
      'location': 'Paris',
      'price': 79.0
    },
  ];

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      // Layout en colonne, tous les enfants seront placés les uns en dessous des autres
      body: Column(
        children: [
          const Text('Liste des véhicules disponibles'),
          // Espace entre le titre et la liste
          const SizedBox(height: 10),
          SizedBox(
            // Taille arbitraire pour afficher toutes les voitures
            height: 500,
            // Pour chaque voiture
            child: ListView.builder(
              itemCount: vehicules.length,
              itemBuilder: (context, index) {
                // Créer une carte ayant pour contenu l'élément de la liste
                return Card(
                  child: ListTile(
                    title: Text('${vehicules[index]['mark']}'),
                    subtitle: Text('${vehicules[index]['model']}'),
                    leading: Image.network('${vehicules[index]['pic']}'),
                    trailing: Text('${vehicules[index]['price']}€'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```
⚠ Il faut toujours veiller à bien penser les choses pour l'utilisateur en faisant du développement mobile. Attention aux zones trop proches les unes des autres, qui causeraient des soucis pour les manipulations au pouce. 😉
