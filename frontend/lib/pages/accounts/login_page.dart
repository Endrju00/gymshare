import 'package:flutter/material.dart';
import 'package:gymshare/components/utils/helpers.dart';
import 'package:gymshare/components/utils/requests.dart';
import 'package:gymshare/components/utils/routes.dart';
import 'package:gymshare/components/widgets/custom_text_form_field.dart';
import 'package:gymshare/components/widgets/logo.dart';
import 'package:gymshare/components/widgets/rounded_rectangle_button.dart';
import 'package:gymshare/components/widgets/scroll_configuration.dart';
import 'package:gymshare/components/widgets/seamless_pattern.dart';
import 'package:gymshare/pages/accounts/signup_page.dart';
import 'package:gymshare/pages/dashboard.dart';
import 'package:gymshare/settings/colors.dart';
import 'package:gymshare/settings/settings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scrollController = ScrollController();

  late String username;
  late String password;

  bool _buttonDisabled = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String? _validateInput(String? value) {
    return value!.isEmpty ? 'Enter at least 1 character.' : null;
  }

  void _logIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() => _buttonDisabled = true);
      _formKey.currentState!.save();
      final gathered = await gatherToken(username, password);
      if (!mounted) return;
      if (gathered) {
        ScaffoldMessenger.of(context).showSnackBar(
          getInfoSnackBar(text: 'Successfuly logged in.'),
        );
        Navigator.of(context).pushReplacement(
          createBottomToTopPageRouteAnimation(const DashboardPage()),
        );
      } else {
        setState(() => _buttonDisabled = false);
        ScaffoldMessenger.of(context).showSnackBar(
          getErrorSnackBar(text: 'Login failed with the specified credentials'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SeamlessPattern(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: mobileWidth),
              child: Form(
                key: _formKey,
                child: ScrollConfig(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          const Hero(tag: 'logo', child: GymShareLogo()),
                          SizedBox(height: size.height * 0.05),
                          CustomTextFormField(
                            key: const Key('login-field'),
                            controller: _usernameController,
                            labelText: 'Username',
                            validator: _validateInput,
                            onSaved: (value) =>
                                setState(() => username = value!),
                            onTap: () => scrollToBottom(_scrollController),
                          ),
                          CustomTextFormField(
                            key: const Key('password-field'),
                            controller: _passwordController,
                            obsecureText: true,
                            labelText: 'Password',
                            validator: _validateInput,
                            onSaved: (value) =>
                                setState(() => password = value!),
                            onTap: () => scrollToBottom(_scrollController),
                          ),
                          const SizedBox(height: 30),
                          const Hero(
                            tag: 'divider',
                            child: Divider(
                              color: primaryTextColor,
                            ),
                          ),
                          Hero(
                            tag: 'button',
                            child: RoundedRectangleButton(
                              isButtonDisabled: _buttonDisabled,
                              width: size.width * 0.8,
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: primaryTextColor, fontSize: 16),
                              ),
                              onPress: () => _logIn(),
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacement(
                              createPageRoute(const SignupPage()),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                bottom: 2, // Space between underline and text
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: primaryTextColor,
                                    width: 1.0, // Underline thickness
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Don’t have account yet? Create a new one',
                                style: TextStyle(
                                  color: primaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
