import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/core/widgets/name_page.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/auth_feature/presentation/state_management/auth_provider.dart';
import 'package:property_inspector/features/auth_feature/presentation/widgets/final_double_text_for_login.dart';
import 'package:property_inspector/features/auth_feature/presentation/widgets/login_and_signup_image.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

class BodyLoginPage extends StatefulWidget {
  const BodyLoginPage({super.key});

  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Form(
        key: globalKey,

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),

            child: Column(
              children: [
                // ================= IMAGE =================
                const LoginAndSignupImage(),

                // ================= TITLE =================
                NamePage(name: 'Login'),

                // ================= NAVIGATION =================

                // ================= FORM =================
                FinalDoubleTextForLogin(
                  emailController: emailController,

                  passwordController: passwordController,
                ),

                // ================= FORGET PASSWORD =================
                SizedBox(height: 20),

                // ================= BUTTON =================
                PrimaryButton(
                  name: "Login",

                  pushing: () async {
                    FocusScope.of(context).unfocus();

                    if (!globalKey.currentState!.validate()) return;

                    final provider = context.read<EmployeeAuthProvider>();

                    final success = await provider.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (success) {
                      emailController.clear();
                      passwordController.clear();

                      Navigator.pushReplacement(
                        context,
                        SlideRight(page: HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            provider.errorMessage ?? 'Login failed',
                          ),
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: isDark ? 20 : 10),

                // OrContinueWith(),
                // GoogleOrFaceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
