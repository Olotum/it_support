import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    actions: [
      Tooltip(
        message: 'Chamados Abertos',
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.assignment),
        ),
      ),
      Tooltip(
        message: 'Relatórios',
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.assessment),
        ),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            child: Text('Meu perfil'),
          ),
          PopupMenuItem(
            child: Text('Configurações'),
            onTap: () {
              Navigator.pushNamed(context, 'configurations');
            },
          ),
        ],
      ),
    ],
  );
}
