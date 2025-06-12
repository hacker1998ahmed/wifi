import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isDark = themeProvider.isDarkMode;
    final isRTL = LanguageUtils.isRTL(languageProvider.currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'help'),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
          children: [
            // FAQ Section
            Text(
              LanguageUtils.getLocalizedString(
                context,
                'frequently_asked_questions',
              ),
              style: ThemeUtils.getSubtitleStyle(context),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing),
            Card(
              child: ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (index, isExpanded) {
                  // TODO: Implement FAQ expansion
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          LanguageUtils.getLocalizedString(
                            context,
                            'faq_1_question',
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        ThemeUtils.kDefaultPadding,
                        0,
                        ThemeUtils.kDefaultPadding,
                        ThemeUtils.kDefaultPadding,
                      ),
                      child: Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'faq_1_answer',
                        ),
                        style: ThemeUtils.getBodyStyle(context),
                      ),
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          LanguageUtils.getLocalizedString(
                            context,
                            'faq_2_question',
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        ThemeUtils.kDefaultPadding,
                        0,
                        ThemeUtils.kDefaultPadding,
                        ThemeUtils.kDefaultPadding,
                      ),
                      child: Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'faq_2_answer',
                        ),
                        style: ThemeUtils.getBodyStyle(context),
                      ),
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          LanguageUtils.getLocalizedString(
                            context,
                            'faq_3_question',
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        ThemeUtils.kDefaultPadding,
                        0,
                        ThemeUtils.kDefaultPadding,
                        ThemeUtils.kDefaultPadding,
                      ),
                      child: Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'faq_3_answer',
                        ),
                        style: ThemeUtils.getBodyStyle(context),
                      ),
                    ),
                    isExpanded: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

            // Contact Support
            Text(
              LanguageUtils.getLocalizedString(
                context,
                'contact_support',
              ),
              style: ThemeUtils.getSubtitleStyle(context),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'email_support',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'email_support_description',
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement email support
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'phone_support',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'phone_support_description',
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement phone support
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.chat_outlined),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'live_chat',
                      ),
                    ),
                    subtitle: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'live_chat_description',
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement live chat
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

            // App Information
            Text(
              LanguageUtils.getLocalizedString(
                context,
                'app_information',
              ),
              style: ThemeUtils.getSubtitleStyle(context),
            ),
            const SizedBox(height: ThemeUtils.kDefaultSpacing),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'about_app',
                      ),
                    ),
                    onTap: () {
                      // TODO: Navigate to about screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'terms_of_service',
                      ),
                    ),
                    onTap: () {
                      // TODO: Navigate to terms of service screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: Text(
                      LanguageUtils.getLocalizedString(
                        context,
                        'privacy_policy',
                      ),
                    ),
                    onTap: () {
                      // TODO: Navigate to privacy policy screen
                    },
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
