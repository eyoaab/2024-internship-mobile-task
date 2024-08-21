import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/User/Data/DataSource/RemoteDataSource/RemoteDateSource.dart';
import 'package:task_6/User/Domaign/Entities/user_entities.dart';
import 'package:task_6/core/error/faliure.dart';

import '../../../helper/helper.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late UserRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = UserRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('userSignUp', () {
    const user = UserEnities(name: 'Test User', username: 'test@example.com', password: 'password123');

    test('should return true when the response code is 201 (Created)', () async {
      
      when(mockHttpClient.post(any, body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 201));

   
      final result = await dataSource.userSignUp(user);

     
      expect(result, const Right(true));
    });

    test('should return false when the response code is not 201', () async {
      
      when(mockHttpClient.post(any, body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 400));

   
      final result = await dataSource.userSignUp(user);

     
      expect(result, const Right(false));
    });

    test('should return ServerFailure when an exception occurs', () async {
      
      when(mockHttpClient.post(any, body: anyNamed('body'), headers: anyNamed('headers')))
          .thenThrow(Exception('Network Error'));

   
      final result = await dataSource.userSignUp(user);

     
      expect(result, isA<Left<Failure, bool>>());
    });
  });

  group('userLogIn', () {
    const  user = UserEnities(name: '',username: 'test@example.com', password: 'password123');
    const token = 'test_token';

    test('should return a token when the response code is 201 (Created)', () async {
      
      final responseJson = json.encode({
        'data': {'access_token': token}
      });

      when(mockHttpClient.post(any, body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(responseJson, 201));

   
      final result = await dataSource.userLogIn(user);

     
      expect(result, const Right(token));
    });

    test('should return an empty string when the response code is not 201', () async {
      
      when(mockHttpClient.post(any, body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Unauthorized', 401));

   
      final result = await dataSource.userLogIn(user);

     
      expect(result, const Right(''));
    });

    test('should return ServerFailure when an exception occurs', () async {
      
      when(mockHttpClient.post(any, body: anyNamed('body')))
          .thenThrow(Exception('Network Error'));

   
      final result = await dataSource.userLogIn(user);

     
      expect(result, isA<Left<Failure, String>>());
    });
  });
}
