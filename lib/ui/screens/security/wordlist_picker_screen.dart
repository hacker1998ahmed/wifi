import 'package:flutter/material.dart';
import 'package:wimax/modules/helpers/wordlist_module.dart';

class WordlistPickerScreen extends StatefulWidget {
  @override
  _WordlistPickerScreenState createState() => _WordlistPickerScreenState();
}

class _WordlistPickerScreenState extends State<WordlistPickerScreen> {
  final WordlistModule _module = WordlistModule();
  String? _selectedWordlist;
  List<String> _sampleWords = [];

  Future<void> _pickWordlist(String filename) async {
    setState(() {
      _selectedWordlist = filename;
    });

    final words = await _module.loadSampleWords(filename);
    setState(() {
      _sampleWords = words;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختيار قائمة كلمات")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _pickWordlist("darkc0de.lst"),
                  child: Text("darkc0de.lst"),
                ),
                ElevatedButton(
                  onPressed: () => _pickWordlist("rockyou1.txt"),
                  child: Text("rockyou1.txt"),
                ),
                ElevatedButton(
                  onPressed: () => _pickWordlist("sample_wordlist.txt"),
                  child: Text("نموذج بسيط"),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_selectedWordlist != null)
              Text(
                "تم اختيار: $_selectedWordlist",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _sampleWords.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(_sampleWords[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
