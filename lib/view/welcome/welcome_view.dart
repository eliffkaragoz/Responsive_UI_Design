import 'package:flutter/material.dart';
import 'package:ui_design/components/buttons/elevated_button_widget.dart';
import 'package:ui_design/components/buttons/text_button.dart';
import 'package:ui_design/extension/context_extension.dart';
import 'package:ui_design/view/sign_in/sign_in_view.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 35, child: Center(child: Image.network(sampleChairsUrl))),
            Expanded(flex: 5, child: FittedBox(child: Text("Welcome",style: TextStyle( fontWeight: FontWeight.w600, color:CustomColorScheme.instance.appBlue,)))),
            const Spacer(flex: 3),
            Expanded(flex: 2, child: FittedBox(child: Text("Manage your expenses",style: TextStyle(color:CustomColorScheme.instance.appBlue,)))),
            Expanded(flex: 3, child: FittedBox(child: Text("seamlessly & intuitively",style: TextStyle(fontWeight: FontWeight.w400 ,color:CustomColorScheme.instance.appBlue, ),))),
            const Spacer(flex: 5,),
            Expanded(flex: 5,child: buildSignInWithGoogleButton(context),),
            const Spacer(),
            Expanded(flex:5,child: buildSignUpButton(context),),
            Expanded( flex: 7, child: buildSignInButton(context),)

        ],),
      ),
     
    )
    ;
  }

  ElevatedButtonWidget buildSignInWithGoogleButton(BuildContext context){
    return ElevatedButtonWidget(
        textColor: CustomColorScheme.instance.appWhite,
        buttonColor: CustomColorScheme.instance.appBlue,
        context: context,
        onPres: (){},
        text: "Sign in with Google");
  }

  ElevatedButtonWidget buildSignUpButton(BuildContext context){
    return ElevatedButtonWidget(
      context: context,
      onPres: (){},
      text: "Create an account",
      buttonColor:CustomColorScheme.instance.appWhite,
      textColor:CustomColorScheme.instance.appBlue,
      borderSideColor: CustomColorScheme.instance.appBlue , );

  }

  Row buildSignInButton(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Already have an account?", style: TextStyle(color: Colors.black45) ),
              TextButtonWidget(context: context, onPres: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SignInView()));
              }, buttonText: "Sign in")
            ],);
  }


}
