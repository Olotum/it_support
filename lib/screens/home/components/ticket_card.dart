import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final int index;
  const TicketCard({
    super.key,
    required this.ticket,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
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
                  Icon(
                    Icons.person,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ticket.user.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
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
                    Icon(
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
    );
  }
}

