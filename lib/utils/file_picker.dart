import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

class FilePickerHelper {
  /// اختيار ملف واحد فقط
  static Future<File?> pickFile({List<String>? extensions}) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: extensions);
    if (result == null) return null;
    return File(result.files.single.path!);
  }

  /// اختيار عدة ملفات
  static Future<List<File>?> pickMultipleFiles({List<String>? extensions}) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: extensions);
    if (result == null) return null;
    return result.paths.map((p) => File(p!)).toList();
  }

  /// اختيار مجلد
  static Future<Directory?> pickDirectory() async {
    final path = await FilePicker.platform.getDirectoryPath();
    if (path == null) return null;
    return Directory(path);
  }
}