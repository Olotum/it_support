import 'package:flutter/material.dart';
import 'package:it_support/model/user.dart';

class Ticket {
  int? id;
  final String issueDescription;
  final User user;
  String? requestTime;

  Ticket({
    this.id,
    required this.issueDescription,
    required this.user,
    this.requestTime,
  });

  // Para salvar o objeto no banco de dados
  Map<String, Object?> toMap() => {
    'id': id,
    'issueDescription': issueDescription,
    'userName': user.name,
    'requestTime': requestTime,
  };
}