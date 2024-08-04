import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';
import 'package:it_support/repository/ticket_repository.dart';
//Este arquivo define o widget TicketCard, que exibe um chamado individual.
class TicketCard extends StatelessWidget {
  final Ticket ticket; // Chamado a ser exibido.
  final int index; // Índice do chamado na lista.
  const TicketCard({
    super.key,
    required this.ticket,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Remove o chamado quando deslizado para a esquerda.
      onDismissed: (_) async {
        final result = await TicketRepository.remove(ticket.id!);
        SnackBar snackBar;
        if (result != 0) {
          snackBar = const SnackBar(content: Text('Chamado removido com sucesso!!!'));
        } else {
          snackBar = const SnackBar(content: Text('Ops. Não foi possível remover o chamado!!!'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(0.8, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      key: Key(ticket.id.toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Badge(
                      label: Text(index.toString()),
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.report,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Chamado #${ticket.id ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ticket.requesterName,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.description,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ticket.issueDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (ticket.requestTime != null) 
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ticket.requestTime!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
