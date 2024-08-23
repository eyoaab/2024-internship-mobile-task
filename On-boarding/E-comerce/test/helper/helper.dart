import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/Product/data/dataSource/local_product_source.dart';
import 'package:task_6/Product/data/dataSource/remote_product_source.dart';
import 'package:task_6/Product/domain/usecase/add_product_usecase.dart';
import 'package:task_6/Product/domain/usecase/delete_product_usecase.dart';
import 'package:task_6/Product/domain/usecase/get_all_products.dart';
import 'package:task_6/Product/domain/usecase/get_product_by_id.dart';
import 'package:task_6/Product/domain/usecase/update_product_usecase.dart';
import 'package:task_6/Product/presentation/bloc/product_bloc.dart';
import 'package:task_6/User/Domain/Usecases/login_usecase.dart';
import 'package:task_6/User/Domain/Usecases/signIn_usecase.dart';
import 'package:task_6/User/presentation/Pages/LogIn/login.dart';
import 'package:task_6/core/Network/networl_info.dart';


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
  LoginUseCase,
  SignUpUseCase

  
])
void main() {}
