import 'package:flutter/material.dart';
import 'package:wimax/core/shell_executor.dart';

class SendLogActivity extends StatelessWidget {
  final ShellExecutor _shell = ShellExecutor();

  Future<String> getAppLog() async {
    final result = await _shell.executeCommand("logcat -d");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("عرض السجلات")),
      body: FutureBuilder<String>(
        future: getAppLog(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SelectableText(snapshot.data ?? "غير متاح"),
          );
        },
      ),
    );
  }
}
