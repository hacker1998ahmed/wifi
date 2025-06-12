import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isDark = themeProvider.isDarkMode;
    final isRTL = LanguageUtils.isRTL(languageProvider.currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'terms_of_service'),
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
                  'terms_introduction_title',
                ),
                style: ThemeUtils.getSubtitleStyle(context),
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing),
              Text(
                LanguageUtils.getLocalizedString(
                  context,
                  'terms_introduction',
                ),
                style: ThemeUtils.getBodyStyle(context),
              ),
              const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

              // Terms Sections
              _buildTermsSection(
                context,
                title: 'terms_acceptance_title',
                content: 'terms_acceptance',
              ),
              _buildTermsSection(
                context,
                title: 'terms_use_title',
                content: 'terms_use',
              ),
              _buildTermsSection(
                context,
                title: 'terms_account_title',
                content: 'terms_account',
              ),
              _buildTermsSection(
                context,
                title: 'terms_privacy_title',
                content: 'terms_privacy',
              ),
              _buildTermsSection(
                context,
                title: 'terms_intellectual_property_title',
                content: 'terms_intellectual_property',
              ),
              _buildTermsSection(
                context,
                title: 'terms_limitation_liability_title',
                content: 'terms_limitation_liability',
              ),
              _buildTermsSection(
                context,
                title: 'terms_termination_title',
                content: 'terms_termination',
              ),
              _buildTermsSection(
                context,
                title: 'terms_changes_title',
                content: 'terms_changes',
              ),
              _buildTermsSection(
                context,
                title: 'terms_governing_law_title',
                content: 'terms_governing_law',
              ),
              _buildTermsSection(
                context,
                title: 'terms_contact_title',
                content: 'terms_contact',
              ),

              // Agreement
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
                          'terms_agreement_title',
                        ),
                        style: ThemeUtils.getSubtitleStyle(context),
                      ),
                      const SizedBox(height: ThemeUtils.kDefaultSpacing),
                      Text(
                        LanguageUtils.getLocalizedString(
                          context,
                          'terms_agreement',
                        ),
                        style: ThemeUtils.getBodyStyle(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsSection(
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
}
