class LoginResponse {
  final String loginStatus;
  final String message;
  final String? userCode; // made nullable if the return response is not haveing this field
  final String timestamp;
  final String status;
  final String? adviserId;// made nullable if the return response is not haveing this field
  final String? adviserName;// made nullable if the return response is not haveing this field
  final String? adviserEmailId;// made nullable if the return response is not haveing this field
  final String? distributorId;
  final String? staffType;

  LoginResponse({
    required this.loginStatus,
    required this.message,
    this.userCode,// made nullable if the return response is not haveing this field
    required this.timestamp,
    required this.status,
    this.adviserId,// made nullable if the return response is not haveing this field
    this.adviserName,// made nullable if the return response is not haveing this field
    this.adviserEmailId,// made nullable if the return response is not haveing this field
    this.distributorId,
    this.staffType
  });

  // Factory constructor to create a LoginResponse object from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        loginStatus: json['loginStatus'],
        message: json['message'],
        userCode: json['userCode'],
        timestamp: json['timestamp'],
        status: json['status'],
        adviserId: json['adviserId'],
        adviserName: json['adviserName'],
        adviserEmailId: json['adviserEmailId'],
        distributorId: json['distributorId'],
        staffType:json['staffType']
    );
  }
}
