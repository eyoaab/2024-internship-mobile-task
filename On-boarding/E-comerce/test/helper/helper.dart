import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/core/Network/networl_info.dart';

// Generate Mock Classes
@GenerateMocks([
  ProductRemoteDataSource,
  ProductLocalDataSource,
  NetworkInfo,
])
void main() {}
