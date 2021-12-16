import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salvatore_app/Providers/login_form_provider.dart';
import 'package:salvatore_app/Services/services.dart';
import 'package:salvatore_app/Utils/Styles/styles.dart';
import 'package:salvatore_app/Utils/Widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueBackground(
        child: SingleChildScrollView(
          child: Center(
            child: CustomCard(
              child: Column(
                children: [
                  Image.asset('lib/Utils/Images/logo.jpeg'),
                  SizedBox(height: 90),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.inputStyle(
                hintText: 'Documento de identidad',
                prefixIcon: Icons.account_circle_outlined,
              ),
              onChanged: (value) => loginForm.docIdentidad = value,
              validator: (value) {
                RegExp regExp = new RegExp(r'^\d{8}(?:[-\s]\d{4})?$');
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese un número de documento válido';
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.inputStyle(
                hintText: 'Contraseña',
                prefixIcon: Icons.password,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'Ingrese la contraseña';
              },
            ),
            SizedBox(height: 15),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: CustomColors.gris_100,
              elevation: 0,
              color: CustomColors.azul_100,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Center(
                  child: Text(
                    loginForm.isLoading ? 'Buscando usuario ...' : 'Ingresar',
                    style: TextStyle(color: CustomColors.blanco),
                  ),
                ),
              ),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final loginService =
                          Provider.of<LoginService>(context, listen: false);
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      final String? errorMessage = await loginService.login(
                          loginForm.docIdentidad, loginForm.password);
                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        //TODO: Mostrar una alerta
                        print(errorMessage);
                        loginForm.isLoading = false;
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
