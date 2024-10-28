import 'dart:convert';



import 'package:bloc/bloc.dart';
import 'package:bold1/api_constants.dart';
import 'package:bold1/blocs/login/login_event.dart';
import 'package:bold1/blocs/login/login_modal.dart';
import 'package:bold1/blocs/login/login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  LoginBloc() : super(LoginInitial()) {
    //Register event  handler for login button press
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      print("event---------------->$event");
      try {
        //for local validation
        // final loginResponse = LoginResponse.fromJson({
        //   "loginStatus":"200",
        //   "message":"aa",
        //   "userCode":"",// made nullable if the return response is not haveing this field
        //   "timestamp":"10 am",
        //   "status":"suc",
        //   "adviserId":"",// made nullable if the return response is not haveing this field
        //   "adviserName":"",// made nullable if the return response is not haveing this field
        //   "adviserEmailId":"",// made nullable if the return response is not haveing this field
        //   "distributorId":"aaad"
        // });
        //
        // emit(LoginSuccess(loginResponse));
        ///////////////////////////////////////////////
        //for cloud validation
        final response = await http.post(Uri.parse(
            '${ApiConstants.baseUrl}/FPMSSERVICE/loginValidate?userId=${event.userId}&password=${event.password}'));
        print('username&passsword------------>${event.userId}&password=${event.password}');
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final loginResponse = LoginResponse.fromJson(jsonData);
          if (loginResponse.loginStatus == "true") {
            emit(LoginSuccess(loginResponse));
          } else {
            emit(LoginFailure("Login failed. please try again."));
          }
        }
      } catch (e) {
        print("error Message [ $e ]");
        emit(LoginFailure("An Error Occured during login .."));
      }
    });
  }
}