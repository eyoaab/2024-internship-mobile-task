import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Product/data/dataSource/local_product_source.dart';
import 'Product/data/dataSource/remote_product_source.dart';
import 'Product/data/repository/product_repository_impl.dart';
import 'Product/domain/repository/product_repository.dart';
import 'Product/domain/usecase/add_product_usecase.dart';
import 'Product/domain/usecase/delete_product_usecase.dart';
import 'Product/domain/usecase/get_all_products.dart';
import 'Product/domain/usecase/get_product_by_id.dart';
import 'Product/domain/usecase/update_product_usecase.dart';
import 'Product/presentation/bloc/product_bloc.dart';
import 'User/Data/DataSource/LocalDataSource/LocalDataSource.dart';
import 'User/Data/DataSource/RemoteDataSource/RemoteDateSource.dart';
import 'User/Data/Repository/UserRepositoryImpl.dart';
import 'User/Domaign/Repository/user_repository.dart';
import 'User/Domaign/Usecases/login_usecase.dart';
import 'User/Domaign/Usecases/signIn_usecase.dart';
import 'User/presentation/bloc/user_bloc.dart';
import 'core/Network/networl_info.dart';

final locator = GetIt.instance;

Future<void> setUp() async {
  //! External Instances
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Connectivity());

  //! Core instances
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  //! Data Sources
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(store: locator()));
      
  locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences:locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator(),));
 

  //! Repositories
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
            remoteDataSource: locator(),
            localDataSource: locator(),
            networkInfo: locator(),
          ));

  locator.registerLazySingleton<UserRepository>(
      () => Userrepositoryimpl(
            userRemoteDataSource: locator(),
            localDataSource: locator(),
            networkInfo: locator(),
          ));


  //! Use Cases
  locator.registerLazySingleton(() => AllProductUsecase(locator()));
  locator.registerLazySingleton(() => ShowProductById(locator()));
  locator.registerLazySingleton(() => DeleteProductbyidUsecase(locator()));
  locator.registerLazySingleton(() => AddProductUsecase(locator()));
  locator.registerLazySingleton(() => UpdateProductUsecase(locator()));

  locator.registerLazySingleton(() => SignUpUseCase(locator()));
  locator.registerLazySingleton(() => LoginUseCase(locator()));

  //! BLoC
  locator.registerFactory(() => ProductBloc(
        getAllProductsUseCase: locator(),
        deleteProductUseCase: locator(),
        getProductByIdUseCase: locator(),
        addProductUseCase: locator(),
        updateProductUseCase: locator(),
      ));

  locator.registerFactory(() => UserBloc(
        loginUsecase: locator(),
        signUpUsecase: locator(),
      ));
}
