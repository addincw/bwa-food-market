import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_fl_food_market/models/api_response.dart';
import 'package:pro_fl_food_market/models/models.dart';
import 'package:pro_fl_food_market/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future getAll() async {
    ApiResponse response = await TransactionServices.getAll();

    (response.value != null)
        ? emit(TransactionLoaded(response.value))
        : emit(TransactionLoadFailed(response.message));
  }
}
