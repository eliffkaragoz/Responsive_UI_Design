import 'package:flutter/material.dart';
import '../../components/text.dart';
import '../../components/buttons/elevated_button_widget.dart';
import '../../components/buttons/text_button.dart';
import '../../extension/context_extension.dart';
import '../sign_in/sign_in_view.dart';
import '../../theme/color_constants.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);
  final sampleChairsUrl =
      "https://img.freepik.com/free-vector/contact-us-concept-illustration_114360-2299.jpg?w=2000";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
        child: context.orientation == Orientation.portrait
            ? buildPortraitDesign(context)
            : buildLandspaceDesign(context),
        // böyle ayırmak yerine buildPortraitDesign içinde de düzenleme yapabilirdim
        // biraz kullanınca kolayına nasıl geliyorsa öyle yapmaya başlarsın zaten ^_^
      ),
    );
  }

  Column buildLandspaceDesign(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 35, child: Center(child: Image.network(sampleChairsUrl))),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: buildSignInWithGoogleButton(),
            ),
            const Spacer(),
            Expanded(
              flex: 5,
              child: buildSignUpButton(),
            ),
          ],
        ),
        Expanded(
          flex: 7,
          child: buildSignInButton(context),
        )
      ],
    );
  }

  Column buildPortraitDesign(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 35, child: Center(child: Image.network(sampleChairsUrl))),
        Expanded(
            flex: 5,
            child: FittedBox(
              child: MyText(
                text: "Welcome",
                color: CustomColorScheme.instance.appBlue,
                fontWeight: FontWeight.w600,
              ),
            )),
        const Spacer(flex: 3),
        Expanded(
            flex: 2,
            child: FittedBox(
                child: MyText(
              text: "Manage your expenses",
              color: CustomColorScheme.instance.appBlue,
            ))),
        Expanded(
            flex: 3,
            child: FittedBox(
                child: MyText(
              text: "seamlessly & intuitively",
              fontWeight: FontWeight.w400,
              color: CustomColorScheme.instance.appBlue,
            ))),
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 5,
          child: buildSignInWithGoogleButton(),
        ),
        const Spacer(),
        Expanded(
          flex: 5,
          child: buildSignUpButton(),
        ),
        Expanded(
          flex: 7,
          child: buildSignInButton(context),
        )
      ],
    );
  }

  MyElevatedButton buildSignInWithGoogleButton() {
    return MyElevatedButton(
      onPressed: () {},
      text: "Sign in with Google",
      buttonColor: CustomColorScheme.instance.appBlue,
      textColor: CustomColorScheme.instance.appWhite,
    );
  }

  MyElevatedButton buildSignUpButton() {
    return MyElevatedButton(
      onPressed: () {},
      text: "Create an account",
      buttonColor: CustomColorScheme.instance.appBlue,
      textColor: CustomColorScheme.instance.appWhite,
    );
  }

  Row buildSignInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyText(
          text: "Already have an account?",
          color: Colors.black45,
          fontSize: 17,
        ),
        MyTextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInView()));
            },
            text: "Sign in")
      ],
    );
  }
}
