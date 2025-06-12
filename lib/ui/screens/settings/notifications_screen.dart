import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wimax/providers/theme_provider.dart';
import 'package:wimax/providers/language_provider.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isDark = themeProvider.isDarkMode;
    final isRTL = LanguageUtils.isRTL(languageProvider.currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'notifications'),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
          children: [
            // Push Notifications
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'push_notifications',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'push_notifications_description',
                      ),
                    ),
                    value: true, // TODO: Implement push notifications
                    onChanged: (value) {
                      // TODO: Implement push notifications toggle
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'email_notifications',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'email_notifications_description',
                      ),
                    ),
                    value: true, // TODO: Implement email notifications
                    onChanged: (value) {
                      // TODO: Implement email notifications toggle
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing),

            // Notification Types
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'security_alerts',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'security_alerts_description',
                      ),
                    ),
                    trailing: Switch(
                      value: true, // TODO: Implement security alerts
                      onChanged: (value) {
                        // TODO: Implement security alerts toggle
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'account_updates',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'account_updates_description',
                      ),
                    ),
                    trailing: Switch(
                      value: true, // TODO: Implement account updates
                      onChanged: (value) {
                        // TODO: Implement account updates toggle
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'marketing_emails',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'marketing_emails_description',
                      ),
                    ),
                    trailing: Switch(
                      value: false, // TODO: Implement marketing emails
                      onChanged: (value) {
                        // TODO: Implement marketing emails toggle
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing),

            // Notification Frequency
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'notification_frequency',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'notification_frequency_description',
                      ),
                    ),
                    trailing: DropdownButton<String>(
                      value: 'daily', // TODO: Implement notification frequency
                      items: [
                        DropdownMenuItem(
                          value: 'immediate',
                          child: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'immediate',
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'daily',
                          child: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'daily',
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'weekly',
                          child: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'weekly',
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        // TODO: Implement notification frequency change
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
