import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/Network/networl_info.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/domain/usecase/get_all_products.dart';

@GenerateMocks([
  http.Client,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  NetworkInfo,
  SharedPreferences,
  AllProductUsecase
])
void main() {}
