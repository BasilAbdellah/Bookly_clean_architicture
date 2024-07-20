import 'package:clean/Features/home/data/DataSource/HomeLocaleDataSource.dart';
import 'package:clean/Features/home/data/DataSource/HomeRemoteDataSource.dart';
import 'package:clean/Features/home/data/repos/HomeRepoImpl.dart';
import 'package:clean/core/utils/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


void SetupServiceLocator() {

  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>()
      ),
      homeLocaleDataSource: HomeLocaleDataSourceImpl()));
}