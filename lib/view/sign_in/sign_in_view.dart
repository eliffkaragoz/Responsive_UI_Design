import 'package:flutter/material.dart';
import 'package:ui_design/components/buttons/elevated_button_widget.dart';
import 'package:ui_design/components/buttons/text_button.dart';
import 'package:ui_design/components/textfield_widget.dart';
import 'package:ui_design/extension/context_extension.dart';
import 'package:ui_design/view/sign_in/signin_appbar_view.dart';
import '../../theme/color_constants.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isTextFiledFocus = false;
  bool isFormValidate = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForSignIn(context: context),
      body: _buildMainContainer(),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      color: CustomColorScheme.instance.appBlue,
      child: Container(
        padding: EdgeInsets.all((context.dynamicHeight(0.04))),
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(topRight: Radius.circular(23), topLeft: Radius.circular(23))),
        child: ListView(
          children: [
            const Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
            SizedBox(height: context.dynamicHeight(0.01)),
            const Text("Hello there, sign in to continue!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38)),
            SizedBox(height: context.dynamicHeight(0.05)),
            buildUserAndPasswordController(),
            SizedBox(height: context.dynamicHeight(0.01)),
            buildForgotPasswordButton(),
            SizedBox(height: context.dynamicHeight(0.01)),
            buildSignInButton(),
            SizedBox(height: context.dynamicHeight(0.11)),
            _buildSignUpText(),
          ],
        ),
      ),
    );
  }

  Form buildUserAndPasswordController() {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      onChanged: () {
        setState(() {
          isFormValidate =
          formKey.currentState!.validate() ? true : false;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Username or email",
              style: TextStyle(color: Colors.black38)),
          SizedBox(height: context.dynamicHeight(0.02)),
          buildEmailTextField(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const Text("Password",
              style: TextStyle(color: Colors.black38)),
          SizedBox(height: context.dynamicHeight(0.02)),
          buildPasswordTextField(),
        ],
      ),
    );
  }

  TextFieldWidget buildEmailTextField() {
    return TextFieldWidget(
        context: context,
        textController: emailController,
        hintText: "Enter your username or email",
        hintTextColor: Colors.black26,
        onTap: () {
          autovalidateMode = AutovalidateMode.always;
        },
        suffixIcon: emailController.text.length >= 1 ? Icons.check_circle : null,
        suffixIconColor: CustomColorScheme.instance.appBlue,
        validators: (value) {
          return value!.isNotEmpty ? null : "";
        }
    );
  }

  TextFieldWidget buildPasswordTextField() {
    return TextFieldWidget(
        onTap: () async {},
        suffixIcon:
        passwordController.text.length >= 1? Icons.check_circle : null,
        suffixIconColor: CustomColorScheme.instance.appBlue,
        context: context,
        textController: passwordController,
        hintText: "Enter your password",
        obscureText: true,
        validators: (value) {
          return value!.isNotEmpty  ? null : "";
        }
    );
  }

  Align buildForgotPasswordButton() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: TextButtonWidget(
            context: context, onPres: () {}, buttonText: "Forgot Password?"));
  }

  ElevatedButtonWidget buildSignInButton() {
    return ElevatedButtonWidget(
      textColor: CustomColorScheme.instance.appWhite,
      context: context,
      onPres: () {},
      text: "Sign in",
      buttonColor: !isFormValidate
          ? CustomColorScheme.instance.inactiveButtonColor
          : CustomColorScheme.instance.appBlue,
    );
  }

  Row _buildSignUpText() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have an account?"),
      TextButtonWidget(context: context, onPres: () {}, buttonText: "Sign up")
    ]);
  }
}
