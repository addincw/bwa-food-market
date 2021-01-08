part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final List<Food> foods;

  FoodLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

class FoodLoadFailed extends FoodState {
  final String message;

  FoodLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
