import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wimax/providers/auth_provider.dart';
import 'package:wimax/providers/theme_provider.dart';
import 'package:wimax/providers/language_provider.dart';
import 'package:wimax/utils/theme_utils.dart';
import 'package:wimax/utils/language_utils.dart';
import 'package:wimax/ui/widgets/custom_button.dart';
import 'package:wimax/ui/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().user;
    _nameController = TextEditingController(text: user?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authProvider = context.read<AuthProvider>();
      await authProvider.updateProfile(
        name: _nameController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          ThemeUtils.getSnackBar(
            context,
            message: LanguageUtils.getLocalizedString(
              context,
              'profile_updated',
            ),
            type: 'success',
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          ThemeUtils.getSnackBar(
            context,
            message: e.toString(),
            type: 'error',
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isDark = themeProvider.isDarkMode;
    final isRTL = LanguageUtils.isRTL(languageProvider.currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageUtils.getLocalizedString(context, 'edit_profile'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeUtils.kDefaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          _nameController.text.isNotEmpty
                              ? _nameController.text[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // TODO: Implement image picker
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                // Name Field
                CustomTextField(
                  controller: _nameController,
                  label: LanguageUtils.getLocalizedString(context, 'name'),
                  hint: LanguageUtils.getLocalizedString(context, 'name_hint'),
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _updateProfile(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LanguageUtils.getLocalizedString(
                        context,
                        'name_required',
                      );
                    }
                    if (value.length < 2) {
                      return LanguageUtils.getLocalizedString(
                        context,
                        'name_too_short',
                      );
                    }
                    return null;
                  },
                ),
                const SizedBox(height: ThemeUtils.kDefaultSpacing * 2),

                // Update Button
                CustomButton(
                  onPressed: _isLoading ? null : _updateProfile,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          LanguageUtils.getLocalizedString(
                            context,
                            'update_profile',
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
