import 'package:abalit/src/provider/login_form_provider.dart';
import 'package:abalit/src/ui/input_decoration.dart';
import 'package:abalit/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ThirdScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Logo(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 280),

                Text('Ayúdanos a recuperar tu contraseña', style: Theme.of(context).textTheme.titleLarge),

                const SizedBox( height: 30 ),

                Text('Introduce tu correo y te enviaremos las instrucciones para poder recuperarla ', style: Theme.of(context).textTheme.subtitle2),

                const SizedBox( height: 30 ),
                    
                ChangeNotifierProvider(
                  create: ( _ ) => LoginFormProvider(),
                  child: _LoginForm()
                ),


              ],
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'correo@ejemplo.kom',
                labelText: 'Correo',
              ),
              onChanged: ( value ) => loginForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Wrong input';

              },
            ),

            SizedBox( height: 100 ),

            _Button(loginForm: loginForm),

          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.green,
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
        child: Text(
          loginForm.isLoading 
            ? 'Enviando'
            : 'Enviar',
          style: TextStyle( color: Colors.white ),
        )
      ),
      onPressed: loginForm.isLoading ? null : () async {
        
        FocusScope.of(context).unfocus();
        
        if( !loginForm.isValidForm() ) return;

        loginForm.isLoading = true;

        await Future.delayed(Duration(seconds: 2 ));

        // TODO: validar si el login es correcto
        loginForm.isLoading = false;

        Navigator.pushReplacementNamed(context, 'first');
      }
    );
  }
}
