

import 'package:flutter/material.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      child: ListView(
        children: [
          Text('Icons view', style: CustomLabels.h1),

          const SizedBox(height: 30),

          const Wrap(   // es como los gridView, pero cuando no quepan mas widgets en la linea, los coloca creando otra linea abajo
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'access_alarm_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.access_alarm_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'account_box_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.account_box_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'add_circle_outline',
                width: 170,
                child: Center(
                  child: Icon(Icons.add_circle_outline),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'airline_seat_flat_angled_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.airline_seat_flat_angled_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'add_road_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.add_road_outlined),
                )
              ),
              WhiteCard(
                title: 'abc_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.abc_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'repartition_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.repartition_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'account_balance_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.account_balance_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'room_service_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.room_service_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'record_voice_over_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.record_voice_over_outlined),
                )
              ),
              SizedBox(width: 10,),
              WhiteCard(
                title: 'zoom_out_map_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.zoom_out_map_outlined),
                )
              )
            ],
          )
        ],
      )
    );
  }
}