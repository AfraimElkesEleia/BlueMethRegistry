import 'package:blue_meth_registery/constants/strings.dart';
import 'package:dio/dio.dart';

import '../models/character.dart';

class CharacterWebServices {
  late final Dio _dio;

  CharacterWebServices() {
    var option = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20)
    );
    _dio = Dio(option);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await _dio.get(
          'character');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}