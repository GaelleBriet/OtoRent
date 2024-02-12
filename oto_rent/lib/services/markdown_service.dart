import 'dart:io';
import '../models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class MarkdownService {
  String generateMarkdown(List<VehicleModel> vehicles) {
    var markdown = '# Liste des véhicules\n\n';
    for (var vehicle in vehicles) {
      markdown += '## ${vehicle.mark} ${vehicle.model}\n';
      markdown += '### ${vehicle.price} €\n';
      markdown += '### Agence : ${vehicle.agencyId}\n';
      markdown += '- Image: ![Image](${vehicle.imageUrl})\n\n';
    }
    return markdown;
  }

  // Future<void> saveFile(String markdownContent) async {
  //   final result = await FilePicker.platform.getDirectoryPath();
  //
  //   if (result == null) {
  //     throw FlutterError('No directory selected');
  //   }
  //
  //   final filePath = '$result/vehicles.md';
  //   final file = File(filePath);
  //   await file.writeAsString(markdownContent);
  // }

  Future<void> saveFile(String markdownContent) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/vehicles.md';
    final file = File(filePath);
    await file.writeAsString(markdownContent);
  }

  // Future<bool> fileExists(String fileName) async {
  //   final result = await FilePicker.platform.getDirectoryPath();
  //   if (result == null) {
  //     throw FlutterError('No directory selected');
  //   }
  //   final filePath = '$result/$fileName';
  //   final file = File(filePath);
  //   return file.exists();
  // }
  Future<bool> fileExists(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    return file.exists();
  }
}