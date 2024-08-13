import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Network/networl_info.dart';
import 'data/dataSource/local_product_source.dart';
import 'data/dataSource/remote_product_source.dart';
import 'data/repository/product_repository_impl.dart';
import 'domain/repository/product_repository.dart';
import 'domain/usecase/add_product_usecase.dart';
import 'domain/usecase/delete_product_usecase.dart';
import 'domain/usecase/get_all_products.dart';
import 'domain/usecase/get_product_by_id.dart';
import 'domain/usecase/update_product_usecase.dart';
import 'presentation/bloc/product_bloc.dart';

final locator = GetIt.instance;

Future<void> setUp() async {
  //! External Instances
  print('external Instances are available');
  locator.registerLazySingleton(() => http.Client());

  print('shared Instances are available');

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  //! Core instances
  print('network instances are available');

  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  //! Data Sources
  print('remote data source');

  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(store: locator()));

  //! Repositories
  print('repositories is available');
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

    print('usecases are available');
  //! Use Cases
  locator.registerLazySingleton(() => AllProductUsecase(locator()));
  locator.registerLazySingleton(() => ShowProductById(locator(),));
  locator.registerLazySingleton(() => DeleteProductbyidUsecase(locator()));
  locator.registerLazySingleton(() => AddProductUsecase(locator()));
  locator.registerLazySingleton(() => UpdateProductUsecase(locator()));

  //! BLoC
  print('bloc is available ');
  locator.registerFactory(() => ProductBloc(
    getAllProductsUseCase: locator(),
    deleteProductUseCase: locator(),
    getProductByIdUseCase: locator(),
    addProductUseCase: locator(),
    updateProductUseCase: locator(),

  ));
}
