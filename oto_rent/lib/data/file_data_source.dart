import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

abstract class FileDataSource {
  static Future<void> exportAndSave(String content) async {
    //1 - récupérer le chemin du ficier avec la 'dialog system'
    final String? path = await FilePicker.platform.saveFile();
    //2 - gestion des erreurs
    if (path == null) {
      throw Exception('Erreur durant la récupération du chemin du fichier');
    }
    //3 - création du pointeur de fichier dart
    final file  = File(path);
    //4 - écriture dans le fichier
    await file.writeAsString(content);
  }
}