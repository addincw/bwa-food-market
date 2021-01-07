import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_fl_food_market/models/api_response.dart';
import 'package:pro_fl_food_market/models/models.dart';
import 'package:pro_fl_food_market/services/services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future signin(String username, String password) async {
    ApiResponse<User> response = await AuthServices.signin(username, password);

    if (response.value != null) {
      emit(AuthSignedIn(response.value));
    } else {
      emit(AuthFailed(response.message));
    }
  }
}
