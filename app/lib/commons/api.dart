import 'package:dio/dio.dart';

const String baseApi = "https://myschool-project.herokuapp.com";

Dio dioClient = Dio(BaseOptions(baseUrl: baseApi));