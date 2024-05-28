import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets.dart/auth_button.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";
  const SignUpScreen({super.key});

  _onLoginTap(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(LoginScreen.routeName);

    print(result);
  }

  _onEmailTap(BuildContext context) {
    /* Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 2),
        reverseTransitionDuration: const Duration(seconds: 2),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UsernameScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation);
          final opacityAnimation =
              Tween(begin: 0.5, end: 1.0).animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: opacityAnimation,
              child: child,
            ),
          );
        })); */
    Navigator.of(context).pushNamed(UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(Localizations.localeOf(context));
    }
    return OrientationBuilder(
      builder: (context, orientation) {
        if (kDebugMode) {
          print(orientation);
        }
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
                  Text(
                    S.of(context).signUpTitle("TikTok"),
                    // "Sign up for TikTok",
                    style: const TextStyle(
                      fontSize: Sizes.size24 + Sizes.size2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    S.of(context).signUpSubtitle,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: isDarkMode(context)
                          ? Colors.grey.shade500
                          : Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: AuthButton(
                          icon: const FaIcon(FontAwesomeIcons.user),
                          text: S.of(context).emailPasswordButton),
                    ),
                    Gaps.v16,
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        text: S.of(context).facebookButton),
                    Gaps.v16,
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.apple),
                        text: S.of(context).appleButton),
                    Gaps.v16,
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        text: S.of(context).googleButton),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap: () => _onEmailTap(context),
                              child: AuthButton(
                                icon: const FaIcon(FontAwesomeIcons.user),
                                text: S.of(context).emailPasswordButton,
                              )),
                        ),
                        Gaps.h16,
                        Expanded(
                            child: AuthButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                          text: S.of(context).appleButton,
                        )),
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
                Text(S.of(context).alreadyHaveAnAccount,
                    style: const TextStyle(fontSize: Sizes.size16)),
                Gaps.h10,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    S.of(context).logIn,
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
