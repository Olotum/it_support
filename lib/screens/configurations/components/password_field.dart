import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var obscurePassword = true;
  var obscureRepeatPassword = true;
  var formValidation = (String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo deve ser preenchido!!!';
    } else if (value.length < 8) {
      return 'O campo deve conter ao menos 8 caracteres!!!';
    }
    // Se estiver tudo OK
    return null;
  };
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: formValidation,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Senha de acesso',
                suffixIcon: IconButton(
                  icon: Icon(
                    (obscurePassword) ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscurePassword,
              obscuringCharacter: '*',
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: formValidation,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Repita a senha de acesso',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureRepeatPassword = !obscureRepeatPassword;
                    });
                  },
                  icon: Icon(
                    (obscureRepeatPassword)
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscureRepeatPassword,
              obscuringCharacter: '*',
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var snackBar = SnackBar(
                    content:
                        Text('Seus dados foram atualizados com sucesso!!!'),
                    showCloseIcon: true,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.key),
                  SizedBox(width: 8),
                  Text('Modificar senha de acesso'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
