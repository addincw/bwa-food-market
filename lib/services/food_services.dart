part of 'services.dart';

class FoodServices {
  static Future<ApiResponse<List<Food>>> getAll() async {
    await Future.delayed(Duration(milliseconds: 2000));

    return ApiResponse(value: mockFoods);
  }
}
