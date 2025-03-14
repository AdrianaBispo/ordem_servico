abstract class FailureSalvarOrdem implements Exception {}

class SalvarOrdemsException implements FailureSalvarOrdem {
  final String message;
  SalvarOrdemsException({required this.message});
}
