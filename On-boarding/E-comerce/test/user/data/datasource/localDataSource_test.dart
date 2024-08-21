import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/User/Data/DataSource/LocalDataSource/LocalDataSource.dart';

import '../../../helper/helper.mocks.dart';


@GenerateMocks([SharedPreferences])
void main() {
  late UserLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = UserLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('saveToken', () {
    const testToken = 'test_token';

    test('should call SharedPreferences to save the token', () async {
      when(mockSharedPreferences.setString('auth_token', testToken))
          .thenAnswer((_) async => true);

      await dataSource.saveToken(testToken);

      verify(mockSharedPreferences.setString('auth_token', testToken));
    });
  });

  group('getToken', () {
    const testToken = 'test_token';

    test('should return token when there is one saved in SharedPreferences', () async {
      when(mockSharedPreferences.getString('auth_token')).thenReturn(testToken);

      final result = await dataSource.getToken();

      expect(result, testToken);
      verify(mockSharedPreferences.getString('auth_token'));
    });

    test('should return null when there is no token saved in SharedPreferences', () async {
      when(mockSharedPreferences.getString('auth_token')).thenReturn(null);

      final result = await dataSource.getToken();

      expect(result, null);
      verify(mockSharedPreferences.getString('auth_token'));
    });
  });

  group('clearToken', () {
    test('should call SharedPreferences to remove the token', () async {
      when(mockSharedPreferences.remove('auth_token')).thenAnswer((_) async => true);

      await dataSource.clearToken();

      verify(mockSharedPreferences.remove('auth_token'));
    });
  });
}
