import "package:flutter/material.dart";
import "data.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const String title = "O'To Rent";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF5521CE),
        ),
      ),
      home: const HomeView(title: title),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title, style: const TextStyle(color: Color.fromARGB(255, 85, 33, 206))),
          elevation: 0,
          centerTitle: true),
      body: Column(
        children: [
          const Text("Liste des véhicules disponibles"),
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final Map<String, Object> vehicle = vehicles[index];
                final String brand = vehicle["brand"]?.toString() ?? "Marque inconnue";
                final String model = vehicle["model"]?.toString() ?? "Modèle inconnu";
                final String? price = vehicle["price"]?.toString();
                final String location = vehicle["picture"]?.toString() ?? "";
                return Card(
                  child: ListTile(
                    leading: Image.network(location, errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    }),
                    title: Text("$brand ($model)"),
                    subtitle: Text(price != null ? "$price €" : "Prix inconnu"),
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
