import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';
import 'package:it_support/model/user.dart';
import 'package:it_support/repository/ticket_repository.dart';
import 'package:it_support/screens/shared/custom_appbar.dart';

class NewTicket extends StatefulWidget {
  const NewTicket({super.key});

  @override
  State<NewTicket> createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  final issueController = TextEditingController();
  final requesterController = TextEditingController();
  final requestTimeController =
      TextEditingController(text: _formatTime(TimeOfDay.now()));
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Novo chamado'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            saveTicket();
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

  void saveTicket() async {
  final user = User.values.firstWhere(
    (u) => u.name == requesterController.text,
    orElse: () => User.user1, // Escolha um valor padrão ou trate o caso de erro apropriadamente
  );

  final ticket = Ticket(
    issueDescription: issueController.text,
    user: user,
    requestTime: requestTimeController.text,
  );

  try {
    final id = await TicketRepository.insert(ticket);
    var snackBar;
    if (id > 0) {
      snackBar = SnackBar(content: Text('O chamado n°$id foi salvo com sucesso!!!'));
    } else {
      snackBar = const SnackBar(content: Text('Ops. Houve um erro inesperado!!!'));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (error) {
    print(error);
  }
}
}


String _formatTime(TimeOfDay time) =>
    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
