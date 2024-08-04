import 'package:flutter/material.dart';
import 'package:it_support/model/ticket.dart';
import 'package:it_support/repository/ticket_repository.dart';
import 'package:it_support/screens/home/components/ticket_card.dart';
import 'package:it_support/screens/shared/custom_appbar.dart';
//Este arquivo define a tela inicial do aplicativo, onde os chamados são exibidos.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Future que contém a lista de chamados.
  late Future<List<Ticket>> _ticketsFuture;

  @override
  void initState() {
    super.initState();
    // Carrega os chamados ao iniciar o estado.
    _loadTickets();
  }

  // Método que carrega os chamados do banco de dados.
  void _loadTickets() {
    _ticketsFuture = TicketRepository.findAll();
  }

  // Método que recarrega os chamados.
  Future<void> _refreshTickets() async {
    setState(() {
      // Recarrega os chamados ao atualizar o estado.
      _loadTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado.
      appBar: customAppBar('IT Support'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a tela de novo chamado e aguarda o resultado.
          final result = await Navigator.pushNamed(context, 'new_ticket');
          if (result == true) {
            // Recarrega os chamados se um novo chamado foi adicionado.
            _refreshTickets();
          }
        },
        tooltip: 'Registrar um novo chamado',
        child: const Icon(Icons.add),
      ),
      // Constrói a interface com base no estado do Future _ticketsFuture.
      body: FutureBuilder<List<Ticket>>(
        future: _ticketsFuture,
        builder: (context, snapshot) {
          // Enquanto estiver aguardando o resultado do Future (estado de espera).
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Mostra um indicador de progresso.
            );
          }
          // Se ocorrer um erro durante a obtenção dos dados.
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar chamados'), // Mostra uma mensagem de erro.
            );
          }
          // Se não houver dados ou a lista estiver vazia.
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Não existem chamados cadastrados'), // Mostra uma mensagem indicando que não há chamados.
            );
          }
          // Obtém a lista de chamados do snapshot.
          var listOfTickets = snapshot.data!;
          return RefreshIndicator(
            // Permite a atualização ao puxar a lista para baixo.
            onRefresh: _refreshTickets,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: listOfTickets.length,
                itemBuilder: (context, index) => TicketCard(
                  index: index,
                  ticket: listOfTickets[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

