part of 'services.dart';

class AuthServices {
  static Future<ApiResponse<User>> signin(
    String username,
    String password,
  ) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiResponse(value: mockUser);
  }
}
