import '../configs/enums.dart';

class ErrorModel {
  String status;
  String details;
  ErrorType type;

  ErrorModel({
    required this.type,
    required this.status,
    required this.details,
  });

  @override
  String toString() {
    return "{'type' : $type, 'status':$status,'details' : $details}";
  }
}
