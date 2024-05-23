import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets.dart/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                Sizes.size40,
              ),
              child: Column(
                children: [
                  if (orientation == Orientation.portrait) Gaps.v80,
                  if (orientation == Orientation.landscape) Gaps.v20,
                  const Text("Sign up for TikTok",
                      style: TextStyle(
                        fontSize: Sizes.size24 + Sizes.size2,
                        fontWeight: FontWeight.w700,
                      )),
                  Gaps.v20,
                  const Text(
                    "Create a profile, follow other accounts, make your own videos, and more.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: const AuthButton(
                          icon: FaIcon(FontAwesomeIcons.user),
                          text: "Use email and password"),
                    ),
                    Gaps.v16,
                    const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.facebook),
                        text: "Continue with Facebook"),
                    Gaps.v16,
                    const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.apple),
                        text: "Continue with Apple"),
                    Gaps.v16,
                    const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.google),
                        text: "Continue with Google"),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: const AuthButton(
                                icon: FaIcon(FontAwesomeIcons.user),
                                text: "Use email and password"),
                          ),
                        ),
                        Gaps.h16,
                        const Expanded(
                          child: AuthButton(
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              text: "Continue with Facebook"),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            // surfaceTintColor: Colors.grey.shade100,
            // color: Colors.grey.shade100,
            elevation: 1,
            // shadowColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(fontSize: Sizes.size16)),
                Gaps.h10,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
