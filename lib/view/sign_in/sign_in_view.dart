import 'package:flutter/material.dart';
import '../../components/text.dart';
import '../../components/buttons/elevated_button_widget.dart';
import '../../components/buttons/text_button.dart';
import '../../components/textfield_widget.dart';
import '../../extension/context_extension.dart';
import 'signin_appbar_view.dart';
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
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(23), topLeft: Radius.circular(23)),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all((context.dynamicHeight(0.04))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                      text: "Welcome Back",
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                  SizedBox(height: context.dynamicHeight(0.01)),
                  const MyText(
                      text: "Hello there, sign in to continue!",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black38),
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
          ),
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
          isFormValidate = formKey.currentState!.validate() ? true : false;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            text: "Username or email",
            color: Colors.black38,
            fontSize: 14,
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
          buildEmailTextField(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const MyText(
            text: "Password",
            color: Colors.black38,
            fontSize: 14,
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
          buildPasswordTextField(),
        ],
      ),
    );
  }

  MyTextFormField buildEmailTextField() {
    return MyTextFormField(
        controller: emailController,
        hintText: "Enter your username or email",
        hintTextColor: Colors.black38,
        onTap: () {
          autovalidateMode = AutovalidateMode.always;
        },
        suffixIcon: emailController.text.isNotEmpty ? Icons.check_circle : null,
        suffixIconColor: CustomColorScheme.instance.appBlue,
        validators: (value) {
          return value!.isNotEmpty ? null : "";
        });
  }

  MyTextFormField buildPasswordTextField() {
    return MyTextFormField(
        onTap: () async {},
        suffixIcon:
            passwordController.text.isNotEmpty ? Icons.check_circle : null,
        suffixIconColor: CustomColorScheme.instance.appBlue,
        controller: passwordController,
        hintText: "Enter your password",
        hintTextColor: Colors.black38,
        obscureText: true,
        validators: (value) {
          return value!.isNotEmpty ? null : "";
        });
  }

  Align buildForgotPasswordButton() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: MyTextButton(
          onPressed: () {},
          text: "Forgot Password?",
        ));
  }

  MyElevatedButton buildSignInButton() {
    return MyElevatedButton(
      onPressed: () {},
      text: "Sign in",
      buttonColor: !isFormValidate
          ? CustomColorScheme.instance.inactiveButtonColor
          : CustomColorScheme.instance.appBlue,
    );
  }

  Row _buildSignUpText() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have an account?"),
      MyTextButton(onPressed: () {}, text: "Sign up")
    ]);
  }
}
