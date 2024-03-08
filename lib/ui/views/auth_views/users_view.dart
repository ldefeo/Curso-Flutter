

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/datatables/users_source.dart';
import 'package:prueba_1/providers/users_provider.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      child: ListView(
        children: [
          Text('Users view', style: CustomLabels.h1),

          const SizedBox(height: 30),

          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(label: const Text('Nombre'), onSort: (index, _ ){  // el onSort es para indicar que la columna puede ordenarse (por medio de una flechita)
                usersProvider.sortColumnIndex = index; // para la flechita
                usersProvider.sort<String>((user) => user.nombre);  // le paso el campo nombre del usuario porque es el que quiero comparar
              }),  
              DataColumn(label: const Text('Email'), onSort: (index, _ ){
                usersProvider.sortColumnIndex = index;  // para la flechita
                usersProvider.sort<String>((user) => user.correo); // le paso el campo correo del usuario porque es el que quiero comparar
              }),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ],
            header: const Text('Usuarios Registrados'), // titulo de la tabla
            source: UsersDTS(users: usersProvider.users)
          )
        ],
      )
    );
  }
}