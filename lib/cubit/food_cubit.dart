import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_fl_food_market/models/api_response.dart';
import 'package:pro_fl_food_market/models/models.dart';
import 'package:pro_fl_food_market/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future getAll() async {
    ApiResponse response = await FoodServices.getAll();

    response.value != null
        ? emit(FoodLoaded(response.value))
        : emit(FoodLoadFailed(response.message));
  }
}
