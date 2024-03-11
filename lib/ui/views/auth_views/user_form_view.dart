

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/providers/user_form_provider.dart';
import 'package:prueba_1/providers/users_provider.dart';
import 'package:prueba_1/services/notifications_service.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
import 'package:prueba_1/ui/inputs/custom_inputs.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class UserFormView extends StatefulWidget {

  final String uid;

  const UserFormView({super.key, required this.uid});

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {

  Usuario? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid)   // esto es para obtener el usuario al cual hacemos referencia por medio del uid
    .then((userDB) {
      userFormProvider.user = userDB;
      setState(() {user = userDB;});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      child: ListView(
        children: [
          Text('Usuario ${user?.nombre}', style: CustomLabels.h1),

          const SizedBox(height: 30),

          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 400,
                child: CircularProgressIndicator(),
              ), 
            ),
          
          if (user != null)
            _UserViewBody()

        ],
      )
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250)
        },
        children: const [
          TableRow(
            children: [
              // TODO: AVATAR
              _Avatar(),

              // Form
              _UserForm()
            ]
          )
        ],
      ),
    );
  }
}

class _UserForm extends StatelessWidget {
  const _UserForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Informacion general',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [

            const SizedBox(height: 30,),

            TextFormField(
              onChanged: ( value ) => userFormProvider.copyUserWith(nombre: value),
              validator: ( value ) {
                if( value == null || value.length < 2 ) return 'Nombre no válido';
                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre de usuario', 
                label: 'Nombre',
                icon: Icons.supervised_user_circle_outlined
              ),
            ),

            const SizedBox(height: 30,),

            TextFormField(
              onChanged: ( value ) => userFormProvider.copyUserWith(correo: value),
              validator: ( value ) {
                if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario', 
                label: 'Email',
                icon: Icons.email_outlined
              ),
            ),

            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
                  onPressed: () async {
                      final saved = await userFormProvider.updateUser();
                      if (saved) {
                        NotificationsService.showSnackbar('Usuario actualizado');
                        Provider.of<UsersProvider>(context, listen: false).updateUser(user);
                      }
                      else {NotificationsService.showNotificationError('Error en la actualizacion');}
                  }, 
                  child: const Text('Guardar', style: TextStyle(color: Colors.white))
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {

  const _Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserFormProvider>(context).user!;

    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2,),
            const SizedBox(height: 10),
            Container(
              width: 150, 
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'lib/assets/images/no-image.jpg'
                    )
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: buildBoxDecoration(),
                      child: FloatingActionButton(
                        onPressed: (){},
                        backgroundColor: Colors.blueAccent,
                        child: const Icon(Icons.add_photo_alternate)
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Text(
              user.nombre,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white, width: 5)
                    );
  }
}