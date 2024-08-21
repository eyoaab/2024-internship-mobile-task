import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/User/Data/Model/user_model.dart';
import 'package:task_6/User/Domaign/Entities/user_entities.dart';
void main() {
  const testUserModel = UserModel(
    name: 'Test User',
    username: 'testuser@example.com',
    password: 'password123',
  );

  group('toJson', () {
    test('should return a valid JSON map containing the proper data', () {
     
      final expectedMap = {
        'name': 'Test User',
        'username': 'testuser@example.com',
        'password': 'password123',
      };

      
      final result = testUserModel.toJson();

      
      expect(result, expectedMap);
    });
  });

  group('fromJson', () {
    test('should return a valid UserModel from JSON', () {
     
      final jsonMap = {
        'name': 'Test User',
        'username': 'testuser@example.com',
        'password': 'password123',
      };

      
      final result = UserModel.fromJson(jsonMap);

      
      expect(result, testUserModel);
    });
  });

  group('toUser', () {
    test('should return a valid UserEnities from UserModel', () {
      
      final result = testUserModel.toUser();

      
      expect(result, isA<UserEnities>());
      expect(result.username, testUserModel.username);
      expect(result.password, testUserModel.password);
      expect(result.name, testUserModel.name);
    });
  });
}
