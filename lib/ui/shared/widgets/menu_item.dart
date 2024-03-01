

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {

  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItem({
    super.key, 
    required this.text,
    required this.icon, 
    this.isActive = false, 
    required this.onPressed
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  bool isHovered = false;  // para saber si el mouse esta encima o no

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(  // contenedor que anima los cambios de estado
      duration: const Duration(milliseconds: 250),
      color: isHovered
        ? Colors.white.withOpacity(0.1)
        : (widget.isActive ? Colors.white.withOpacity(0.1) : Colors.transparent),
      child: Material(
        color: Colors.transparent,
        child: InkWell(   // me genera un rectangulo sobre el widget MenuItem que me permite notar cuando lo presiono y cuando no
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: MouseRegion(   // me cambia los estados del mouse, cuando se coloca encima y cuando no
              onEnter: (_) => setState(() {
                isHovered = true;
              }),
              onExit: (_) => setState(() {
                isHovered = false;
              }),
              child: Row(  // se genera el widget MenuItem
                children: [
                  Icon(widget.icon, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8)
                    ),
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