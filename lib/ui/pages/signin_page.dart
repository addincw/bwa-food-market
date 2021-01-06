part of 'pages.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isSigninLoading = false;

  @override
  Widget build(BuildContext context) {
    _signin() {
      setState(() {
        _isSigninLoading = true;
      });

      // context.bloc<AuthCubit>().signin()
      // Get.to(MainPage());
    }

    return GeneralLayout(
      title: "Sign In",
      subtitle: "Find your best meal ever",
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tDefaultPadding,
          vertical: tDefaultPadding,
        ),
        child: Column(
          children: [
            FmTextField(
              labelName: "Email Address",
              isEditable: !_isSigninLoading,
            ),
            FmTextField(
              labelName: "Password",
              isEditable: !_isSigninLoading,
            ),
            FmButton(
              text: "Sign In",
              textStyle: tButtonPrimaryFontSyle,
              color: tPrimaryColor,
              isLoading: _isSigninLoading,
              onPressed: _signin,
            ),
            SizedBox(height: 8.0),
            FmButton(
              text: "Create New Account",
              textStyle: tButtonSecondaryFontSyle,
              color: tSubtitleColor,
              isLoading: false,
              onPressed: () {
                Get.to(SignupPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
