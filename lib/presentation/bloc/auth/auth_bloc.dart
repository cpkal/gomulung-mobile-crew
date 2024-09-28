import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:las_crew/core/util/secure_storage.dart';
import 'package:las_crew/data/datasource/remote/api_service.dart';
import 'package:las_crew/data/model/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SecureStorage _secureStorage = SecureStorage();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegisterEvent>(_onRegister);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthCheckEvent>(_onCheck);
  }

  Future _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    // emit(AuthLoading());
    // Simulate a network request
    await ApiService.postData('login', {
      'email': event.email,
      'password': event.password,
    }).then((res) {
      var token = jsonDecode(res.body)["token"];
      if (res.statusCode == 200) {
        _secureStorage.writeSecureData(key: 'token', value: token);
        emit(AuthAuthenticated(User(token: token)));
      } else {
        emit(AuthError('Invalid email or password'));
      }
    }).catchError((e) {
      emit(AuthError('Invalid email or password'));
    });

    // Future.delayed(Duration(seconds: 2), () {
    //   if (event.email == ' [email protected]' && event.password == 'password') {
    //     emit(AuthAuthenticated(User(name: 'John Doe', email: event.email)));
    //   } else {
    //     emit(AuthError('Invalid email or password'));
    //   }
    // });
  }

  Future _onRegister(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    await ApiService.postFile('register', {
      'name': event.name,
      'phone_number': event.phone_number,
      'address': event.address,
      'email': event.email,
      'password': event.password,
      'sim': event.sim,
      'ktp': event.ktp,
      'stnk': event.stnk,
    }).then((res) {
      print(res);
    }).catchError((e) {
      emit(AuthError('Invalid email or password'));
    });
  }

  Future _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _secureStorage.deleteSecureData(key: 'token');
    emit(AuthUnauthenticated());
  }

  Future _onCheck(AuthCheckEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final token = await _secureStorage.readSecureData(key: 'token');
    if (token != null) {
      print('brah');
      emit(AuthAuthenticated(User(token: token)));
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
