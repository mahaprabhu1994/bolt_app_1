import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String? custId;
  final String custName;
  final String custCateg;
  final String emailId;
  final String custStatus;
  final String? adviserId;
  final String? customerStatusId;
  final String? customerStatus;

  final String? custInitials;
  final String? dob;
  final String? sex;

  const Client({
    this.custId,
    required this.custName,
    required this.custCateg,
    required this.emailId,
    required this.custStatus,
    this.adviserId,
    this.customerStatusId,
    this.customerStatus,

    this.custInitials,
    this.dob,
    this.sex
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      // custId: json['custid'] ?? '',
      custName:json['custName'] ?? '',
      custCateg:json['custCateg'] ?? '',
      emailId:json['emailId'] ?? '',
      custStatus:json['custStatus'] ?? '',
      // adviserId: json['adviserStaff1']?['advstfId'] ?? '',
      // customerStatusId: json['masterCustomerStatus']?['customerStatusId'] ?? '',
      // customerStatus: json['masterCustomerStatus']?['customerStatus'] ?? '',
      custInitials:json['custInitials'] ??'',
      dob:json['dob'] ?? '',
      sex:json['sex'] ?? '',
    );
  }

  @override
  List<Object?> get props => [custId, adviserId, customerStatusId, customerStatus];
}