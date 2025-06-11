import 'package:flutter/material.dart';
import 'package:wimax_flutter/core/tool_manager.dart';
import 'package:wimax_flutter/core/constants.dart';

class SetupToolsScreen extends StatefulWidget {
  @override
  _SetupToolsScreenState createState() => _SetupToolsScreenState();
}

class _SetupToolsScreenState extends State<SetupToolsScreen> {
  final ToolManager _toolManager = ToolManager();
  bool _checkingTools = true;
  Map<String, bool> _toolStatus = {};
  String _statusMessage = 'جاري فحص الأدوات...';

  @override
  void initState() {
    super.initState();
    _checkTools();
  }

  Future<void> _checkTools() async {
    setState(() {
      _checkingTools = true;
      _statusMessage = 'جاري فحص الأدوات...';
    });

    final toolsDir = await _toolManager.getToolsDirectory();
    final toolPaths = AppConstants.toolDescriptions.keys.toList();

    final Map<String, bool> status = {};
    for (var tool in toolPaths) {
      final path = '${toolsDir.path}/$tool';
      final exists = await File(path).exists();
      status[tool] = exists;
    }

    setState(() {
      _toolStatus = status;
      _checkingTools = false;
    });
  }

  Future<void> _downloadMissingTools() async {
    setState(() {
      _checkingTools = true;
      _statusMessage = 'جاري التنزيل...';
    });

    await _toolManager.downloadMissingTools((progress) {
      setState(() {
        _statusMessage = progress;
      });
    });

    await _checkTools();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إعداد الأدوات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_checkingTools)
              Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.builder(
                  itemCount: AppConstants.toolDescriptions.length,
                  itemBuilder: (context, index) {
                    final tool = AppConstants.toolDescriptions.keys.elementAt(index);
                    final desc = AppConstants.toolDescriptions[tool]!;
                    final isPresent = _toolStatus[tool] ?? false;

                    return ListTile(
                      leading: Icon(isPresent ? Icons.check_circle : Icons.cancel),
                      title: Text(tool),
                      subtitle: Text(desc),
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            Text(_statusMessage),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _checkingTools ? null : _downloadMissingTools,
              icon: Icon(Icons.download),
              label: Text('تنزيل الأدوات'),
            ),
          ],
        ),
      ),
    );
  }
}