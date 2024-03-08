

import 'package:flutter/material.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/navigation_service.dart';

class UsersDTS extends DataTableSource {

  final List<Usuario> users;

  UsersDTS({required this.users});

  @override
  DataRow getRow(int index) {
    
    final image = Image(image: AssetImage('lib/assets/images/no-image.jpg'), width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( ClipOval(child: image) ),
        DataCell(Text(users[index].nombre)),
        DataCell(Text(users[index].correo)),
        DataCell(Text(users[index].uid)),
        DataCell(
          IconButton(
            onPressed: (){
              NavigationService.replaceTo('${Flurorouter.usersroute}/${users[index].uid}');
            },
            icon: const Icon(Icons.edit_outlined)
          )
        ),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => users.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}