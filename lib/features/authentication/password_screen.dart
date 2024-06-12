import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets.dart/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _isPassword1Valid() && _isPassword2Valid();
  }

  bool _isPassword1Valid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  bool _isPassword2Valid() {
    if (_password.isEmpty) return false;
    // final regExp = RegExp(
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // final regExp = RegExp("^[a-zA-Z0-9!#%&]");
    final regExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).+$');
    if (!regExp.hasMatch(_password)) {
      print(_password);
      return false;
    }
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty || !_isPasswordValid()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayScreen(),
        ));
  }

  void _onClear() {
    _passwordController.clear();
    setState(() {});
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sign up",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "Create password",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                TextField(
                  controller: _passwordController,
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClear,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: "Make it strong!",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                const Text(
                  "Your password must have:",
                  style: TextStyle(
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size16 + Sizes.size2,
                      color: _isPassword1Valid()
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                    Gaps.h5,
                    const Text(
                      "8 to 20 characters",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ],
                ),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size16 + Sizes.size2,
                      color: _isPassword2Valid()
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                    Gaps.h5,
                    const Text(
                      "Letters, numbers, and special characters",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ],
                ),
                Gaps.v16,
                GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: !_isPasswordValid(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
