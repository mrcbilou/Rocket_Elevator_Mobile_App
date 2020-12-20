import 'dart:convert';

import 'package:rocket_elevators_mobile_app/customer_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String customerUrl = "https://localhost:3003/api/Customer";

  Future<List<Customer>> getCustomer() async {
    Response res = await get(customerUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Customer> customers =
          body.map((dynamic item) => Customer.fromJson(item)).toList();

      return customers;
    } else {
      throw "Can't get customers";
    }
  }
}
