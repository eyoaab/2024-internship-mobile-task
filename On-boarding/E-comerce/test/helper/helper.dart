import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/domain/repository/product_repository.dart';
import 'package:task_6/core/Network/networl_info.dart';

@GenerateMocks([
  http.Client,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  NetworkInfo,
])
void main() {}
