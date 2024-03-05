

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/register_form_provider.dart';
import 'package:prueba_1/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(builder: ( context ) {
        
        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          color: Colors.grey[400],
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(50.0),
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: ( value ) => registerFormProvider.name = value,
                        validator: ( value ) {
                          if (value == null ) return 'Ingrese su nombre';
                          return null;
                        } ,
                        style: const TextStyle(color: Colors.black),
                        decoration: CustomInputs.loginAndRegisterDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                        ),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        onChanged: ( value ) => registerFormProvider.email = value,
                        validator: ( value ) {
                        if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                          return null;
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: CustomInputs.loginAndRegisterDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                        ),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        onChanged: ( value ) => registerFormProvider.password = value,
                        validator: ( value ) {
                          if (value == null ) return 'Ingrese su contraseña';
                          if (value.length < 6 ) return 'La contraseña debe ser de 6 caracteres o mas';
                          return null; // Valido
                        },
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: CustomInputs.loginAndRegisterDecoration(
                          hint: '********',
                          label: 'Contraseña',
                        ),
                      ),
                      const SizedBox(height: 50,),
                      OutlinedButton(
                        onPressed: (){
                          final validForm = registerFormProvider.validateForm();

                          if ( !validForm ) return;

                          Provider.of<AuthProvider>(context, listen: false).register(
                            registerFormProvider.name, 
                            registerFormProvider.email, 
                            registerFormProvider.password
                          );
                        }, 
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_forward_outlined),
                            Text('Ingresar')
                          ],
                        )
                      )
                    ],
                  ),
                )
              )
            )
          )
        );
      })
    );
  }
}