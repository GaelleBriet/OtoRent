import 'package:flutter/material.dart';
import 'VehicleDetailPage.dart';
import 'data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oto Rent',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.cyan,
          secondary: Colors.blueAccent,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const MyHomePage(title: 'Oto Rent'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Paramètres',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Une snackBar comme ça pour rien...')));
            },
            color: Colors.white,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: vehicules.length,
        itemBuilder: (context, index) {
          final vehicule = vehicules[index];
          return Container(
            height: 100, // Define a height for the Container
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.grey[800],
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${vehicule['pic']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                            '${vehicule['mark']} ${vehicule['model']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                            'Location: ${vehicule['location']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Text(
                            '${vehicule['price']}€',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehicleDetailPage(vehicle: vehicule),
                            ),
                          );
                        },
                      ),
                    )
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}