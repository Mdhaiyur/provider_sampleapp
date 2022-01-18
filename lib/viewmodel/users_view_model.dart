
import 'package:provider_sampleapp/data/model/user.dart';
import 'package:provider_sampleapp/data/remote/api_status.dart';
import 'package:provider_sampleapp/data/remote/product_api_impl.dart';

class UsersViewModel {
  /// user api call
  Future<List<User>?> fetchUsers() async {
    var response = await ProductApiImple().getUsers();
    if (response is Success) {
      return response.successResponse as List<User>;
    }
  }
}