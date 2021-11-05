part of app.auth;

class ForgetPassword extends StatefulWidget {
  static String route = '${AuthView.route}/forget';

  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final NavigatorService navigator = locator<NavigatorService>();
  final AuthRepository repository = locator<AuthRepository>();
  TextEditingController emailController = TextEditingController();

  String? emailError;
//validEmail?
  bool get disableButton =>
      emailController.text.isEmpty;

  void onValidateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool isValid = regex.hasMatch(email.trim());
    setState(() {
      isValid ? emailError = null : emailError = 'invalid email';
    });
  }

  void navigateToSignUp() {
    navigator.push(route: SignUpView.route, key: navigator.authNavigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: getProportionsScreenHeigth(14), color: secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: ClampingScrollPhysics(),
        child: Center(
          // padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionsScreenHeigth(28),
                  ),
                ),
                Text(
                  'Please enter your email and we will send \n you a link to return to yout account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: getProportionsScreenHeigth(15),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.09,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Input(
                      label: 'email',
                      icon: Icons.email_outlined,
                      controller: emailController,
                      placeholder: 'add your email',
                      onChange: onValidateEmail,
                      error: emailError,
                    )),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.09,
                ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
                //logica de enviar correo
                child: Button(
                  label: 'Send',
                  disable: disableButton,
                  onPress: () {},
                )
          ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                    ),
                    InkWell(
                      onTap: navigateToSignUp,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: primaryColor),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
