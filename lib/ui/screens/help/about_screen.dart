import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'about_app'),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final packageInfo = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.security,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing),
                  Text(
                    packageInfo.appName,
                    style: ThemeUtils.getTitleStyle(context),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'v${packageInfo.version} (${packageInfo.buildNumber})',
                    style: ThemeUtils.getBodyStyle(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                  // App Description
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'app_description_title',
                            ),
                            style: ThemeUtils.getSubtitleStyle(context),
                          ),
                          const SizedBox(height: ThemeUtils.kDefaultSpacing),
                          Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'app_description',
                            ),
                            style: ThemeUtils.getBodyStyle(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                  // Features
                  Text(
                    LanguageUtils.getLocalizedString(
                      context,
                      'features',
                    ),
                    style: ThemeUtils.getSubtitleStyle(context),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing),
                  Card(
                    child: Column(
                      children: [
                        _buildFeatureItem(
                          context,
                          icon: Icons.security,
                          title: 'feature_1_title',
                          description: 'feature_1_description',
                        ),
                        const Divider(),
                        _buildFeatureItem(
                          context,
                          icon: Icons.language,
                          title: 'feature_2_title',
                          description: 'feature_2_description',
                        ),
                        const Divider(),
                        _buildFeatureItem(
                          context,
                          icon: Icons.dark_mode,
                          title: 'feature_3_title',
                          description: 'feature_3_description',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                  // Developer Information
                  Text(
                    LanguageUtils.getLocalizedString(
                      context,
                      'developer_information',
                    ),
                    style: ThemeUtils.getSubtitleStyle(context),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.code),
                          title: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'developer_name',
                            ),
                          ),
                          subtitle: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'developer_role',
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'developer_email',
                            ),
                          ),
                          onTap: () {
                            // TODO: Implement email contact
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.link),
                          title: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'developer_website',
                            ),
                          ),
                          onTap: () {
                            // TODO: Implement website link
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                  // Legal Information
                  Text(
                    LanguageUtils.getLocalizedString(
                      context,
                      'legal_information',
                    ),
                    style: ThemeUtils.getSubtitleStyle(context),
                  ),
                  const SizedBox(height: ThemeUtils.kDefaultSpacing),
                  Card(
                    child: Column(
                      children: [
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
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.copyright_outlined),
                          title: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'copyright',
                            ),
                          ),
                          subtitle: Text(
                            LanguageUtils.getLocalizedString(
                              context,
                              'copyright_year',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: ThemeUtils.kDefaultSpacing),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
