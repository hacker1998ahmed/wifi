import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حسابك")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("البريد الإلكتروني:", style: Theme.of(context).textTheme.titleMedium),
            Text(user?.email ?? "غير معروف", style: Theme.of(context).textTheme.bodyLarge),

            SizedBox(height: 20),
            Text("معرف المستخدم (UID):", style: Theme.of(context).textTheme.titleMedium),
            SelectableText(user?.uid ?? "غير معروف"),

            SizedBox(height: 30),
            Text("تقاريرك الشخصية:", style: Theme.of(context).textTheme.titleLarge),
            Divider(),
            Expanded(
              child: Text("تظهر التقارير هنا عند تسجيلها"),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout),
              label: Text("تسجيل الخروج"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}