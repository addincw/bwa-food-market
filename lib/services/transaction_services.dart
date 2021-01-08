part of 'services.dart';

class TransactionServices {
  static Future<ApiResponse<List<Transaction>>> getAll() async {
    await Future.delayed(Duration(milliseconds: 2000));

    return ApiResponse(value: mockTransactions);
  }
}
