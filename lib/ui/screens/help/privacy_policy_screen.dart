import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isDark = themeProvider.isDarkMode;
    final isRTL = LanguageUtils.isRTL(languageProvider.currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'privacy_policy'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Last Updated
              Text(
                LanguageUtils.getLocalizedString(
                  context,
                  'last_updated',
                ),
                style: ThemeUtils.getCaptionStyle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

              // Introduction
              Text(
                LanguageUtils.getLocalizedString(
                  context,
                  'privacy_introduction_title',
                ),
                style: ThemeUtils.getSubtitleStyle(context),
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing),
              Text(
                LanguageUtils.getLocalizedString(
                  context,
                  'privacy_introduction',
                ),
                style: ThemeUtils.getBodyStyle(context),
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

              // Privacy Sections
              _buildPrivacySection(
                context,
                title: 'privacy_information_collection_title',
                content: 'privacy_information_collection',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_information_use_title',
                content: 'privacy_information_use',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_information_sharing_title',
                content: 'privacy_information_sharing',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_data_security_title',
                content: 'privacy_data_security',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_cookies_title',
                content: 'privacy_cookies',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_third_party_title',
                content: 'privacy_third_party',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_children_title',
                content: 'privacy_children',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_user_rights_title',
                content: 'privacy_user_rights',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_changes_title',
                content: 'privacy_changes',
              ),
              _buildPrivacySection(
                context,
                title: 'privacy_contact_title',
                content: 'privacy_contact',
              ),

              // Consent
              const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'privacy_consent_title',
                        ),
                        style: ThemeUtils.getSubtitleStyle(context),
                      ),
                      const SizedBox(height: ThemeUtils.kDefaultSpacing),
                      Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'privacy_consent',
                        ),
                        style: ThemeUtils.getBodyStyle(context),
                      ),
                    ],
                  ),
                ),
              ),

              // Data Protection Rights
              const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),
              Text(
                LanguageUtils.getLocalizedString(
                  context,
                  'privacy_rights_title',
                ),
                style: ThemeUtils.getSubtitleStyle(context),
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing),
              Card(
                child: Column(
                  children: [
                    _buildRightItem(
                      context,
                      title: 'privacy_right_1_title',
                      description: 'privacy_right_1_description',
                    ),
                    const Divider(),
                    _buildRightItem(
                      context,
                      title: 'privacy_right_2_title',
                      description: 'privacy_right_2_description',
                    ),
                    const Divider(),
                    _buildRightItem(
                      context,
                      title: 'privacy_right_3_title',
                      description: 'privacy_right_3_description',
                    ),
                    const Divider(),
                    _buildRightItem(
                      context,
                      title: 'privacy_right_4_title',
                      description: 'privacy_right_4_description',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacySection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageUtils.getLocalizedString(context, title),
          style: ThemeUtils.getSubtitleStyle(context),
        ),
        const SizedBox(height: ThemeUtils.kDefaultSpacing),
        Text(
          LanguageUtils.getLocalizedString(context, content),
          style: ThemeUtils.getBodyStyle(context),
        ),
        const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),
      ],
    );
  }

  Widget _buildRightItem(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageUtils.getLocalizedString(context, title),
            style: ThemeUtils.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeUtils.kDefaultSpacing / 2),
          Text(
            LanguageUtils.getLocalizedString(context, description),
            style: ThemeUtils.getBodyStyle(context),
          ),
        ],
      ),
    );
  }
}
