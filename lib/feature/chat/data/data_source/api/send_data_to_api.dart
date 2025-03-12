import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:i_health/core/common/failure_model.dart';

abstract class SendDataToApi {
  Future<Either<Failure, String>> sendDataToApi({required String inputText});
}

class SendDataToApiImpl extends SendDataToApi {
  @override
  Future<Either<Failure, String>> sendDataToApi(
      {required String inputText}) async {
    final url = Uri.parse('http://10.0.2.2:5000/predict');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': inputText}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['prediction'] == 'drug reaction') {
          return const Right(
              "I’m sorry, I couldn’t find a diagnosis for your symptoms. Please make sure to enter valid symptoms, and try again.");
        } else {
          return Right('${data['prediction'].toString()}');
        }
      } else {
        return Left(Failure('Error: ${response.reasonPhrase}'));
      }
    } catch (e) {
      return Left(Failure('Error: $e'));
    }
  }
}
