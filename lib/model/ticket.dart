//Este arquivo define a classe Ticket, que representa um chamado de suporte técnico.
class Ticket {
  final int? id; // Identificador do chamado.
  final String issueDescription; // Descrição do problema.
  final String requesterName; // Nome do solicitante.
  final String? requestTime; // Hora da solicitação.

  Ticket({
    this.id,
    required this.issueDescription,
    required this.requesterName,
    this.requestTime,
  });

  // Converte um objeto Ticket para um mapa para facilitar a inserção no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'issueDescription': issueDescription,
      'requesterName': requesterName,
      'requestTime': requestTime,
    };
  }

  // Cria um objeto Ticket a partir de um mapa, útil para converter os resultados do banco de dados em objetos.
  static Ticket fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'],
      issueDescription: map['issueDescription'],
      requesterName: map['requesterName'],
      requestTime: map['requestTime'],
    );
  }
}
