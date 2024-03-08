

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/providers/users_provider.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
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

    Provider.of<UsersProvider>(context, listen: false).getUserById(widget.uid)   // esto es para obtener el usuario al cual hacemos referencia por medio del uid
    .then((userDB) => setState(() {
      user = userDB;
    }));
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
        columnWidths: {
          0: FixedColumnWidth(250)
        },
        children: [
          TableRow(
            children: [
              // TODO: AVATAR
              _Avatar(),

              // Form
              Container(
                height: 200,
                color: Colors.blue,
              )
            ]
          )
        ],
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
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2,),
            SizedBox(height: 10),
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
                        child: Icon(Icons.add_photo_alternate),
                        backgroundColor: Colors.blueAccent
                      ),
                    ),
                  ),
                  
                ],
              ),
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