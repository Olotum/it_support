import 'package:flutter/material.dart';
import 'package:it_support/screens/configurations/components/password_field.dart';
import 'package:it_support/screens/shared/custom_appbar.dart';

class Configurations extends StatefulWidget {
  Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
  var switchRememberAccess = true;
  var switch_two_factor_auth = false;
  var switch_notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Configurações'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                    value: switchRememberAccess,
                    onChanged: (isActive) {
                      setState(() {
                        switchRememberAccess = isActive;
                      });
                    }),
                const Text('Lembrar meus dados de acesso'),
              ],
            ),
            Row(
              children: [
                Switch(
                    value: switch_two_factor_auth,
                    onChanged: (isActive) {
                      setState(() {
                        switch_two_factor_auth = isActive;
                      });
                    }),
                const Text('Autenticação de dois fatores')
              ],
            ),
            Row(
              children: [
                Switch(
                    value: switch_notifications,
                    onChanged: (isActive) {
                      setState(() {
                        switch_notifications = isActive;
                      });
                    }),
                const Text('Notificações')
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Dados de acesso',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            PasswordField(),
          ],
        ),
      ),
    );
  }
}
