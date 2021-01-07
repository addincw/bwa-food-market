part of 'pages.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSigninLoading = false;

  @override
  Widget build(BuildContext context) {
    _signin() async {
      setState(() {
        _isSigninLoading = true;
      });

      await context.read<AuthCubit>().signin(
            emailController.text,
            passwordController.text,
          );

      setState(() {
        _isSigninLoading = false;
      });

      AuthState state = context.read<AuthCubit>().state;
      if (state is AuthFailed) {
        Get.snackbar(
          'Oops!',
          state.message,
          snackStyle: SnackStyle.GROUNDED,
          margin: EdgeInsets.zero,
          backgroundColor: Color(0xFFD9435E),
          colorText: Colors.white,
          icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
        );
      } else if (state is AuthSignedIn) {
        Get.to(MainPage());
      }
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
