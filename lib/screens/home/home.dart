import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';
import 'package:it_support/model/user.dart';
import 'package:it_support/screens/home/components/ticket_card.dart';
import 'package:it_support/screens/shared/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var ticket = Ticket(
      id: 124,
      issueDescription: 'Computador não liga',
      user: User.user1,
      requestTime: '12:00',
    );

    return Scaffold(
      appBar: customAppBar('IT Support'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new_ticket');
        },
        tooltip: 'Registrar um novo chamado',
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => TicketCard(
                  index: index,
                  ticket: ticket,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
