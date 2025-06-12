import 'package:flutter/material.dart';
import 'package:wimax/modules/network/recon.dart';

class NetworkScanScreen extends StatefulWidget {
  @override
  _NetworkScanScreenState createState() => _NetworkScanScreenState();
}

class _NetworkScanScreenState extends State<NetworkScanScreen> {
  final ReconModule _recon = ReconModule();
  bool _scanning = false;
  List<Map<String, dynamic>> _devices = [];

  Future<void> _startScan() async {
    setState(() {
      _scanning = true;
    });

    try {
      final devices = await _recon.scanNetworkUsingArpScan();
      setState(() {
        _devices = devices;
        _scanning = false;
      });
    } catch (e) {
      setState(() {
        _scanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('استكشاف الشبكة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _scanning ? null : _startScan,
              icon: Icon(Icons.search),
              label: Text('بدء المسح'),
            ),
            SizedBox(height: 20),
            if (_scanning)
              Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _devices.length,
                  itemBuilder: (context, index) {
                    final device = _devices[index];
                    return Card(
                      color: Colors.grey[850],
                      child: ListTile(
                        title: Text('IP: ${device['ip']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MAC: ${device['mac']}'),
                            Text('الشركة: ${device['vendor']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
