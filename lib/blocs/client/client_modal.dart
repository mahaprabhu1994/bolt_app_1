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
  final String? nric;
  final String? nationality;
  final String? maritalStatus;


  // > Residence Address : (Primary)
  final String? resAddr1;
  final String? resAddr2;
  final String? resAddr3;
  final String? resAddr4;
  final String? resCity;
  final String? resCountry;
  final String? resPostalcode;
  final String? resState;

  // > Office Address
  final String? offAddr1;
  final String? offAddr2;
  final String? offAddr3;
  final String? offAddr4;
  final String? offCity;
  final String? offCountry;
  final String? offPostalcode;
  final String? offState;

  // > Correspondence Address
  final String? corAddr1;
  final String? corAddr2;
  final String? corAddr3;
  final String? corAddr4;
  final String? corCity;
  final String? corCountry;
  final String? corPostalcode;
  final String? corState;

  // -------------------------------
  // > Residence
  final String? resPh;
  final String? resHandPhone;
  final String? resFax;

  // > Office
  final String? offPh;
  final String? offHandPhone;
  final String? offFax;

  // > Other
  final String? othPh;
  final String? othHandPhone;
  final String? othFax;

  // --------------------------------

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
    this.sex,
    this.nric,
    this.nationality,
    this.maritalStatus,

    this.resAddr1,
    this.resAddr2,
    this.resAddr3,
    this.resAddr4,
    this.resCity,
    this.resCountry,
    this.resPostalcode,
    this.resState,

    this.offAddr1,
    this.offAddr2,
    this.offAddr3,
    this.offAddr4,
    this.offCity,
    this.offCountry,
    this.offPostalcode,
    this.offState,

    this.corAddr1,
    this.corAddr2,
    this.corAddr3,
    this.corAddr4,
    this.corCity,
    this.corCountry,
    this.corPostalcode,
    this.corState,

    this.resPh,
    this.resHandPhone,
    this.resFax,

    this.offPh,
    this.offHandPhone,
    this.offFax,

    this.othPh,
    this.othHandPhone,
    this.othFax,
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
      nric:json['nric'] ?? '',
      nationality:json['nationality'] ?? '',
      maritalStatus:json['maritalStatus'] ?? '',

        resAddr1:json['resAddr1'] ?? '',
        resAddr2:json['resAddr2'] ?? '',
        resAddr3:json['resAddr3'] ?? '',
        resAddr4:json['resAddr4'] ?? '',
        resCity:json['resCity'] ?? '',
        resCountry:json['resCountry'] ?? '',
        resPostalcode:json['resPostalcode'] ?? '',
        resState:json['resState'] ?? '',
        offAddr1:json['offAddr1'] ?? '',
        offAddr2:json['offAddr2'] ?? '',
        offAddr3:json['offAddr3'] ?? '',
        offAddr4:json['offAddr4'] ?? '',
        offCity:json['offCity'] ?? '',
        offCountry:json['offCountry'] ?? '',
        offPostalcode:json['offPostalcode'] ?? '',
        offState:json['offState'] ?? '',
        corAddr1:json['corAddr1'] ?? '',
        corAddr2:json['corAddr2'] ?? '',
        corAddr3:json['corAddr3'] ?? '',
        corAddr4:json['corAddr4'] ?? '',
        corCity:json['corCity'] ?? '',
        corCountry:json['corCountry'] ?? '',
        corPostalcode:json['corPostalcode'] ?? '',
        corState:json['corState'] ?? '',
        resPh:json['resPh'] ?? '',
        resHandPhone:json['resHandPhone'] ?? '',
        resFax:json['resFax'] ?? '',
        offPh:json['offPh'] ?? '',
        offHandPhone:json['offHandPhone'] ?? '',
        offFax:json['offFax'] ?? '',
        othPh:json['othPh'] ?? '',
        othHandPhone:json['othHandPhone'] ?? '',
        othFax:json['othFax'] ?? '',
    );
  }

  @override
  List<Object?> get props => [custId, adviserId, customerStatusId, customerStatus];
}