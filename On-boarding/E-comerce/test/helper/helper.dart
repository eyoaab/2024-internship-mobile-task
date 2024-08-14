import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/Network/networl_info.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/domain/usecase/add_product_usecase.dart';
import 'package:task_6/domain/usecase/delete_product_usecase.dart';
import 'package:task_6/domain/usecase/get_all_products.dart';
import 'package:task_6/domain/usecase/get_product_by_id.dart';
import 'package:task_6/domain/usecase/update_product_usecase.dart';
import 'package:task_6/presentation/bloc/product_bloc.dart';

@GenerateMocks([
  http.Client,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  NetworkInfo,
  SharedPreferences,
  AllProductUsecase,
  ShowProductById,
  UpdateProductUsecase,
  DeleteProductbyidUsecase,
  AddProductUsecase,
  ProductBloc ,

  
])
void main() {}
