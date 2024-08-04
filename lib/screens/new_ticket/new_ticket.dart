import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';
import 'package:it_support/repository/ticket_repository.dart';
import 'package:it_support/screens/shared/custom_appbar.dart';
//Este arquivo define a tela para registrar um novo chamado.
class NewTicket extends StatefulWidget {
  const NewTicket({super.key});

  @override
  State<NewTicket> createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  final issueController = TextEditingController(); // Controlador para o campo de descrição do problema.
  final requesterController = TextEditingController(); // Controlador para o campo de nome do solicitante.
  final requestTimeController = TextEditingController(); // Controlador para o campo de horário da solicitação.
  final formKey = GlobalKey<FormState>(); // Chave para o formulário.

  @override
  void initState() {
    super.initState();
    requestTimeController.text = _formatTime(TimeOfDay.now()); // Define o horário atual no campo de horário da solicitação.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Novo chamado'), // AppBar personalizado.
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            saveTicket(); // Salva o chamado se o formulário for válido.
          }
        },
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Descrição do problema é obrigatória'
                    : null,
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
                controller: issueController,
                decoration: const InputDecoration(
                  label: Text('Descrição do problema'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Nome do solicitante é obrigatório'
                    : null,
                textCapitalization: TextCapitalization.words,
                controller: requesterController,
                decoration: const InputDecoration(
                  label: Text('Nome do solicitante'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: requestTimeController,
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Horário da solicitação'),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.schedule),
                    onPressed: () async {
                      requestTimeController.text = await showTimeDialog();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Mostra um diálogo para selecionar o horário.
  Future<String> showTimeDialog() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    return _formatTime(time!);
  }

  // Salva o chamado no banco de dados.
  void saveTicket() async {
    final ticket = Ticket(
      issueDescription: issueController.text,
      requesterName: requesterController.text,
      requestTime: requestTimeController.text,
    );

    try {
      final id = await TicketRepository.insert(ticket);
      var snackBar;
      if (id > 0) {
        snackBar = SnackBar(content: Text('O chamado n°$id foi salvo com sucesso!!!'));
        Navigator.pop(context, true); // Retorna true para indicar que um novo chamado foi adicionado.
      } else {
        snackBar = const SnackBar(content: Text('Ops. Houve um erro inesperado!!!'));
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      print(error);
    }
  }

  // Formata o horário em uma string.
  String _formatTime(TimeOfDay time) =>
    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
}
